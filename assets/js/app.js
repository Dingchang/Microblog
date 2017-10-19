// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"

let handlebars = require("handlebars");

handlebars.registerHelper('like_count', function(json) {
  return Object.keys(json).length;
});

$(function() {
  if (!$("#likes-template").length > 0) {
    // Wrong page
    return;
  }

  let tt = $($("#likes-template")[0]);
  let code = tt.html();
  let tmpl = handlebars.compile(code);

  let dd = $($("#post-likes")[0]);
  let path = dd.data('path');
  let post_id = dd.data('message_id');

  let lb = $($("#like-button")[0]);
  let like_user_id = lb.data('user_id');
  let like_post_id = lb.data('message_id');

  function fetch_likes() {
    function got_likes(data) {
      console.log(data);
      let html = tmpl(data);
      dd.html(html);
    }

    $.ajax({
      url: path,
      data: {post_id: post_id},
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: got_likes,
    });
  }

  function add_like() {
    let data = {like: {post_id: like_post_id, user_id: like_user_id}}

    $.ajax({
      url: path,
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: fetch_likes,
    });

    $("#like-button").val("");
    $("#like-button")[0].disabled=true;
  }

  lb.click(add_like);

  fetch_likes();
})
