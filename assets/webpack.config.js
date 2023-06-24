const path = require("path");
const glob = require("glob");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = (_env, options) => {
  const devMode = options.mode !== "production";

  const terserPlugin = (compiler) => {
    const TerserPlugin = require("terser-webpack-plugin");
    new TerserPlugin({
      terserOptions: {
        compress: {},
      },
    }).apply(compiler);
  };

  const minimizer = [
    // If in development mode, do not compress the code
    !devMode && terserPlugin,
    new CssMinimizerPlugin({}),
  ].filter(Boolean);

  return {
    optimization: {
      minimize: true,
      minimizer,
    },
    entry: {
      app: glob.sync("./vendor/**/*.js").concat(["./index.js"]),
    },
    output: {
      filename: "[name].js",
      path: path.resolve(__dirname, "../priv/static/assets"),
    },
    devtool: devMode ? "source-map" : undefined,
    module: {
      rules: [
        {
          test: /\.m?js/,
          resolve: {
            fullySpecified: false,
          },
        },
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: "babel-loader",
          },
        },
        {
          test: /\.[s]?css$/,
          use: [
            MiniCssExtractPlugin.loader,
            "css-loader",
            {
              loader: "sass-loader",
              options: {
                // `dart-sass` is preferred
                implementation: require("sass"),
              },
            },
          ],
        },
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({ filename: "../assets/[name].css" }),
      new CopyWebpackPlugin({ patterns: [{ from: "static/", to: "../" }] }),
    ],
  };
};
