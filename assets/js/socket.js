// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/web/endpoint.ex":
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/2" function
// in "lib/web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, pass the token on connect as below. Or remove it
// from connect if you don't care about authentication.

  socket.connect()

  let channel = socket.channel("updates:all", {})

  const newMessage = function(payload) {
    let msg = document.createElement("tr");

    let msg_user = document.createElement("td");
    msg_user.innerText = payload.username;

    // message content
    let msg_content = document.createElement("td");
    msg_content.innerText = payload.message_contant;

    // message show path
    let msg_show = document.createElement("td");
    msg_show.className = "text-right";
    let msg_show_span = document.createElement("span");
    let msg_show_link = document.createElement("a");
    msg_show_link.href = payload.message_show_path;
    msg_show_link.className = "btn btn-default btn-xs";
    msg_show_link.innerText = "read";
    msg_show_span.appendChild(msg_show_link);
    msg_show.appendChild(msg_show_span);

    msg.appendChild(msg_user);
    msg.appendChild(msg_content);
    msg.appendChild(msg_show);

    return msg;
  }

  channel.on("new_message", payload => {
    let message = newMessage(payload);
    $('#message-index').prepend(message);
  });

  channel.join()
    .receive("ok", resp => { console.log("Joined successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) });

// Now that you are connected, you can join channels with a topic:
export default socket
