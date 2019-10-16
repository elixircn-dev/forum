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
import "./bulma-event";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
let Hooks = {};
const defaultOptions = {
  // 选中的导航栏子项
  select_navbar_item: null
};
const defaultTitle = document.title;

class PageHook {
  constructor(options = defaultOptions) {
    this.options = Object.assign({ ...defaultOptions }, options);
    this.updateTitle = this.updateTitle.bind(this);
  }
  mounted() {
    if (this.options.select_navbar_item) {
      let item = document.querySelector(
        `.navbar-menu .navbar-item[href='${this.options.select_navbar_item}']`
      );
      item.classList.add("is-active");
    }
    this.updateTitle();
    window.scrollTo({ top: 0, behavior: "smooth" });
  }
  destroyed() {
    if (this.options.select_navbar_item) {
      let item = document.querySelector(
        `.navbar-menu .navbar-item[href='${this.options.select_navbar_item}']`
      );
      item.classList.remove("is-active");
    }
    document.title = defaultTitle;
  }
  updateTitle() {
    let hookName = this.constructor.name;
    let container = document.querySelector(
      `.container[phx-hook='${hookName}']`
    );
    let title = defaultTitle;
    if (container != null) {
      let subtitle = container.getAttribute("cm-title");
      if (subtitle != null) {
        title = `${subtitle} · ${defaultTitle}`;
      }
    }
    document.title = title;
  }
}

class ArticlePage extends PageHook {
  constructor() {
    super({ select_navbar_item: "/topics" });
  }
}
class TopicPage extends PageHook {
  constructor() {
    super({ select_navbar_item: "/topics" });
  }
}
class IndexPage extends PageHook {
  constructor() {
    super({ select_navbar_item: "/" });
  }
}
class CityPage extends PageHook {}
class UserPage extends PageHook {}
class ContributePage extends PageHook {
  constructor() {
    super({ select_navbar_item: "/contribute" });
  }
}
class AboutPage extends PageHook {
  constructor() {
    super({ select_navbar_item: "/about" });
  }
}
class LoginPage extends PageHook {
  constructor() {
    super({ select_navbar_item: "/login" });
  }
}

Hooks.ArticlePage = new ArticlePage();
Hooks.IndexPage = new IndexPage();
Hooks.TopicPage = new TopicPage();
Hooks.CityPage = new CityPage();
Hooks.UserPage = new UserPage();
Hooks.ContributePage = new ContributePage();
Hooks.AboutPage = new AboutPage();
Hooks.LoginPage = new LoginPage();
// 更新标题
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks });
liveSocket.connect();
