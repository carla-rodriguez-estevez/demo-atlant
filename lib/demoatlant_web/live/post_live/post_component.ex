defmodule DemoatlantWeb.PostLive.PostComponent do
  use DemoatlantWeb, :live_component
  import Demoatlant

  def render(assigns) do
    ~H"""
     <div  style="margin-top: 20px">
    <div id={"post-#{@post.id}"} style="outline: auto; padding: 20px" class="post">
      <div class="row">
        <div class="column column-10"  style="background-color: grey; margin-left: 8px">
          <div class="post-avatar">

          </div>
        </div>
        <div class="column column-90 post-body">
          <span class="user_name">@<%= @post.username %></span>
          <br />
          <p><%= @post.body %></p>
        </div>
      </div>
      <div class="row actions_bar">
        <div class="column column-33 text-center">
          <a href="#" phx-click="like" phx-target={@myself}>
            <span>💟</span> <%= @post.likes_count %>
          </a>
        </div>
        <div class="column column-33 text-center">
          <a href="#" phx-click="repost" phx-target={@myself}>
            <span>🔄</span> <%= @post.repost_count %>
          </a>
        </div>
        <div class="column column-33 text-center">
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            <span>✏️</span>
          <% end %>
          <span>&nbsp;&nbsp;</span>
          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] do %>
            <span>❌</span>
          <% end %>
        </div>
      </div>
      </div>
    </div>
    """
  end

  def handle_event("delete", _, socket) do
    {:noreply, socket}
  end

  def handle_event("like", _, socket) do
    Demoatlant.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    Demoatlant.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end

end
