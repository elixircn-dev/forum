// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../scss/app.scss";
import "@fortawesome/fontawesome-free/js/all";
import "mdn-polyfills/CustomEvent";
import "mdn-polyfills/String.prototype.startsWith";
import "mdn-polyfills/Array.from";
import "mdn-polyfills/NodeList.prototype.forEach";
import "mdn-polyfills/Element.prototype.closest";
import "mdn-polyfills/Element.prototype.matches";
import "child-replace-with-polyfill";
import "url-search-params-polyfill";
import "formdata-polyfill";
import "classlist-polyfill";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
import "phoenix_html";
import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";
import "./bulma_event";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
let Hooks = {};
const defaultOptions = {
  // 选中「主题」
  in_topic: false
};
const defaultTitle = document.title;
const topicItem = document.querySelector(".navbar-item[href='/topics']");

class PageHook {
  constructor(options = defaultOptions) {
    this.options = Object.assign({ ...defaultOptions }, options);
    this.updateTitle = this.updateTitle.bind(this);
  }
  mounted() {
    if (this.options.in_topic) {
      topicItem.classList.add("is-active");
    }
    this.updateTitle();
    window.scrollTo({ top: 0, behavior: "smooth" });
  }
  destroyed() {
    if (this.options.in_topic) {
      topicItem.classList.remove("is-active");
    }
    document.title = defaultTitle;
  }
  updateTitle() {
    let hookName = this.constructor.name;
    let container = document.querySelector(
      `.container[phx-hook='${hookName}']`
    );
    console.log(`container: ${container}`);
    let title = defaultTitle;
    if (container != null) {
      let subtitle = container.getAttribute("cm-title");
      console.log(`subtitle: ${subtitle}`);
      if (subtitle != null) {
        title = `${subtitle} · ${defaultTitle}`;
      }
    }
    document.title = title;
  }
}

class ArticlePage extends PageHook {
  constructor() {
    super({ in_topic: true });
  }
}
class TopicPage extends PageHook {
  constructor() {
    super({ in_topic: true });
  }
}
class IndexPage extends PageHook {}
class CityPage extends PageHook {}

Hooks.ArticlePage = new ArticlePage();
Hooks.IndexPage = new IndexPage();
Hooks.TopicPage = new TopicPage();
Hooks.CityPage = new CityPage();
// 更新标题
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks });
liveSocket.connect();
