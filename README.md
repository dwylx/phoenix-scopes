<div align="center">

# Phoenix 1.8 `Scopes` Walkthrough

</div>

This repo is a quick (though _comprehensive_) **walkthrough**
of **`Phoenix 1.8 scopes`**
following the **_official_ docs**:
[hexdocs.pm/phoenix/1.8.1/scopes.html](https://hexdocs.pm/phoenix/1.8.1/scopes.html)

## 0. Prerequisites

Ensure you have `Elixir`, `Phoenix` and `Postgres` installed.
If you don't, please see:

+ [elixir-lang.org/install](https://elixir-lang.org/install.html)
+ [hexdocs.pm/phoenix/installation](https://hexdocs.pm/phoenix/installation.html)
+ [postgresql.org/download](https://www.postgresql.org/download)
  + Mac: [postgresapp.com](https://postgresapp.com)

With those all working on your `localhost`,
confirm you have the latest `Phoenix` installer, `1.8.1` at the time of writing:

```sh
mix phx.new -v
```

You should see output similar to the following:
```sh
Phoenix installer v1.8.1
```

## 1. Create New `Phoenix` App

```sh
mix phx.new my_app
```

> Named the app `my_app` to conform to the docs
> which use `MyApp` naming convention.

You should see output similar to the following:

```sh
* creating my_app/lib/my_app/application.ex
* creating my_app/lib/my_app.ex
* creating my_app/lib/my_app_web/controllers/error_json.ex
* creating my_app/lib/my_app_web/endpoint.ex
* creating my_app/lib/my_app_web/router.ex
* creating my_app/lib/my_app_web/telemetry.ex
* creating my_app/lib/my_app_web.ex
* creating my_app/mix.exs
* creating my_app/README.md
* creating my_app/.formatter.exs
* creating my_app/.gitignore
* creating my_app/test/support/conn_case.ex
* creating my_app/test/test_helper.exs
* creating my_app/test/my_app_web/controllers/error_json_test.exs
* creating my_app/lib/my_app/repo.ex
* creating my_app/priv/repo/migrations/.formatter.exs
* creating my_app/priv/repo/seeds.exs
* creating my_app/test/support/data_case.ex
* creating my_app/lib/my_app_web/controllers/error_html.ex
* creating my_app/test/my_app_web/controllers/error_html_test.exs
* creating my_app/lib/my_app_web/components/core_components.ex
* creating my_app/lib/my_app_web/controllers/page_controller.ex
* creating my_app/lib/my_app_web/controllers/page_html.ex
* creating my_app/lib/my_app_web/controllers/page_html/home.html.heex
* creating my_app/test/my_app_web/controllers/page_controller_test.exs
* creating my_app/lib/my_app_web/components/layouts/root.html.heex
* creating my_app/lib/my_app_web/components/layouts.ex
* creating my_app/priv/static/images/logo.svg
* creating my_app/lib/my_app/mailer.ex
* creating my_app/lib/my_app_web/gettext.ex
* creating my_app/priv/gettext/en/LC_MESSAGES/errors.po
* creating my_app/priv/gettext/errors.pot
* creating my_app/priv/static/robots.txt
* creating my_app/priv/static/favicon.ico
* creating my_app/assets/js/app.js
* creating my_app/assets/vendor/topbar.js
* creating my_app/assets/tsconfig.json
* creating my_app/assets/css/app.css
* creating my_app/assets/vendor/heroicons.js
* creating my_app/assets/vendor/daisyui.js
* creating my_app/assets/vendor/daisyui-theme.js

Fetch and install dependencies? [Yn] 
```

Type `y` in your terminal followed by the `Return` key.
You will see the output:

```sh
* running mix deps.get
* running mix assets.setup
* running mix deps.compile

We are almost there! The following steps are missing:

    $ cd my_app

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

### 1.1 Finish Setting Up The New App

Follow the instructions given.

Create the Database:

```sh
mix ecto.create
```

### 1.2 Run The App

Run the command:

```sh
mix phx.server
```

Wait a few seconds for it compile and download `Tailwind` + `DaisyUI`. ⏳

```sh
[info] Running MyAppWeb.Endpoint with Bandit 1.8.0 at 127.0.0.1:4000 (http)
[info] Access MyAppWeb.Endpoint at http://localhost:4000
[watch] build finished, watching for changes...
≈ tailwindcss v4.1.7

/*! 🌼 daisyUI 5.0.35 */
Done in 113ms
```

Visit [`localhost:4000`](http://localhost:4000) from your browser.
You should expect to see the following:

![phoenix-1.8-homepage](https://github.com/user-attachments/assets/2761c876-83e0-4bc6-ab41-0f441abc68ef)

With the basic App working, we can now follow the `Scopes` docs!

## 2. Follow Scopes Guide (`mix phx.gen.auth`)

Follow the `scopes` guide to the letter
[hexdocs.pm/phoenix/1.8.1/scopes.html](https://hexdocs.pm/phoenix/1.8.1/scopes.html#phx-gen-auth)

```sh
mix phx.gen.auth Accounts User users
```

You will see the response:

```sh
An authentication system can be created in two different ways:
- Using Phoenix.LiveView (default)
- Using Phoenix.Controller only
Do you want to create a LiveView based authentication system? [Yn]
```

I chose the `default` (`Phoenix.LiveView`) with `y` followed by `Return`.

The following is output:

```sh
* creating priv/repo/migrations/20250911110038_create_users_auth_tables.exs
* creating lib/my_app/accounts/user_notifier.ex
* creating lib/my_app/accounts/user.ex
* creating lib/my_app/accounts/user_token.ex
* creating lib/my_app_web/user_auth.ex
* creating test/my_app_web/user_auth_test.exs
* creating lib/my_app_web/controllers/user_session_controller.ex
* creating test/my_app_web/controllers/user_session_controller_test.exs
* creating lib/my_app/accounts/scope.ex
* creating lib/my_app_web/live/user_live/registration.ex
* creating test/my_app_web/live/user_live/registration_test.exs
* creating lib/my_app_web/live/user_live/login.ex
* creating test/my_app_web/live/user_live/login_test.exs
* creating lib/my_app_web/live/user_live/settings.ex
* creating test/my_app_web/live/user_live/settings_test.exs
* creating lib/my_app_web/live/user_live/confirmation.ex
* creating test/my_app_web/live/user_live/confirmation_test.exs
* creating lib/my_app/accounts.ex
* injecting lib/my_app/accounts.ex
* creating test/my_app/accounts_test.exs
* injecting test/my_app/accounts_test.exs
* creating test/support/fixtures/accounts_fixtures.ex
* injecting test/support/fixtures/accounts_fixtures.ex
* injecting test/support/conn_case.ex
* injecting config/test.exs
* injecting config/config.exs
* injecting mix.exs
* injecting lib/my_app_web/router.ex
* injecting lib/my_app_web/router.ex - imports
* injecting lib/my_app_web/router.ex - plug
* injecting lib/my_app_web/components/layouts/root.html.heex
* injecting AGENTS.md

Please re-fetch your dependencies with the following command:

    $ mix deps.get

Remember to update your repository by running migrations:

    $ mix ecto.migrate

Once you are ready, visit "/users/register"
to create your account and then access "/dev/mailbox" to
see the account confirmation email.
```

Ran the instructed commands:

```sh
mix deps.get
```

Got:

```sh
Resolving Hex dependencies...
Resolution completed in 0.189s
New:
  bcrypt_elixir 3.3.2
  comeonin 5.5.1
Unchanged:
  bandit 1.8.0
  cc_precompiler 0.1.11
  db_connection 2.8.1
  decimal 2.3.0
  dns_cluster 0.2.0
  ecto 3.13.2
  ecto_sql 3.13.2
  elixir_make 0.9.0
  esbuild 0.10.0
  expo 1.1.0
  file_system 1.1.1
  finch 0.20.0
  fine 0.1.4
  gettext 0.26.2
  hpax 1.0.3
  jason 1.4.4
  lazy_html 0.1.7
  mime 2.0.7
  mint 1.7.1
  nimble_options 1.1.1
  nimble_pool 1.1.0
  phoenix 1.8.1
  phoenix_ecto 4.6.5
  phoenix_html 4.2.1
  phoenix_live_dashboard 0.8.7
  phoenix_live_reload 1.6.1
  phoenix_live_view 1.1.11
  phoenix_pubsub 2.1.3
  phoenix_template 1.0.4
  plug 1.18.1
  plug_crypto 2.1.1
  postgrex 0.21.1
  req 0.5.15
  swoosh 1.19.5
  tailwind 0.4.0
  telemetry 1.3.0
  telemetry_metrics 1.1.0
  telemetry_poller 1.3.0
  thousand_island 1.4.1
  websock 0.5.3
  websock_adapter 0.5.8
* Getting bcrypt_elixir (Hex package)
* Getting comeonin (Hex package)
```

Followed by:

```sh
mix ecto.migrate
```

which had the following output:

```sh
==> comeonin
Compiling 3 files (.ex)
Generated comeonin app
==> elixir_make
Compiling 8 files (.ex)
Generated elixir_make app
==> bcrypt_elixir
mkdir -p "/Users/n/code/phoenix-scopes/_build/dev/lib/bcrypt_elixir/priv"
clang -g -O3 -Wall -Wno-format-truncation -I"/opt/homebrew/Cellar/erlang/27.2.1/lib/erlang/erts-15.2.1/include" -Ic_src -fPIC -shared -dynamiclib -undefined dynamic_lookup c_src/bcrypt_nif.c c_src/blowfish.c -o "/Users/n/code/phoenix-scopes/_build/dev/lib/bcrypt_elixir/priv/bcrypt_nif.so"
Compiling 3 files (.ex)
Generated bcrypt_elixir app
==> my_app
Compiling 26 files (.ex)
Generated my_app app

12:04:41.152 [info] == Running 20250911110038 MyApp.Repo.Migrations.CreateUsersAuthTables.change/0 forward

12:04:41.153 [info] execute "CREATE EXTENSION IF NOT EXISTS citext"

12:04:41.188 [info] create table users

12:04:41.193 [info] create index users_email_index

12:04:41.193 [info] create table users_tokens

12:04:41.196 [info] create index users_tokens_user_id_index

12:04:41.196 [info] create index users_tokens_context_token_index

12:04:41.198 [info] == Migrated 20250911110038 in 0.0s
```

All good so far.

Re-run the server and confirm it's still working:

```sh
mix phx.server
```

Output looks promising:

```sh
[info] Running MyAppWeb.Endpoint with Bandit 1.8.0 at 127.0.0.1:4000 (http)
[info] Access MyAppWeb.Endpoint at http://localhost:4000
[watch] build finished, watching for changes...
≈ tailwindcss v4.1.7

/*! 🌼 daisyUI 5.0.35 */
Done in 108ms
```

The homepage of the App now has **Register** and **Log in** links in the header:

<img src="https://github.com/user-attachments/assets/8bec31f0-f2c0-4cb1-a1ce-58974e5e9ec8" />

Clicking on the **Register** link
the browser navigates to the
[/users/register](http://localhost:4000/users/register)
path:

<img src="https://github.com/user-attachments/assets/dc43cc6b-339b-4023-b841-38cc7d4ee888" />

Input any valid email address
e.g: `test@mail.com`
And click/tap on the "**Create an account**" button:

<img src="https://github.com/user-attachments/assets/8526f6e6-4342-498e-8503-cb1c28b14aa3" />

You should see a confirmation popup saying:
"An email was sent to test@mail.com, please access it to confirm your account":

<img width="939" height="651" alt="Image" src="https://github.com/user-attachments/assets/bf1e5608-0f81-4796-929e-844cfd992c88" />

No email was sent as this is `localhost`.
Instead, navigate to
[localhost:4000/dev/mailbox/](http://localhost:4000/dev/mailbox/)
where you will see the confirmation email:

<img src="https://github.com/user-attachments/assets/66e7d25b-18fb-4251-9060-faa59e4c3a28" />

Click on (or copy-paste) the link<sup>1</sup>
to verify the email address.

> <sup>1</sup> **Clicking** on **links** in **email**
> is a **_massive_ security anti-pattern**
> that primes people for
> [**Phishing**](https://en.wikipedia.org/wiki/Phishing)
> attacks which can result in a
> [total system compromise](https://en.wikipedia.org/wiki/Advanced_persistent_threat).
> If you work in a high security environment
> or care about teaching people good security habits/practices,
> don't encourage them to click links in emails. 🙏
> It just takes _one_ "weakest link" in your organisation/family
> to bring down the whole castle! 😢 <br />
> But for the sake of following this guide ...

You will see a page similar to the following:

<img width="1150" height="627" alt="Image" src="https://github.com/user-attachments/assets/60390afc-475e-4b15-adfd-0ac1c1aef867" />

Click one of the buttons, e.g: "**Confirm and _stay_ logged in**".

The "User confirmed successfully" dialogue will appear:

<img width="1150" height="627" alt="Image" src="https://github.com/user-attachments/assets/af070656-ac23-4d9c-b8f1-c9c37ebfef59" />

So we know the basic **`auth`** is working. ✅

## 3. Create Blog With Scopes

In the next section of the official `Scopes` docs
["Integration of scopes in the Phoenix generators"](https://hexdocs.pm/phoenix/1.8.1/scopes.html#integration-of-scopes-in-the-phoenix-generators)
we are instructed to run the following command:

```sh
mix phx.gen.live Blog Post posts title:string body:text
```

You should see output similar to the following:

```sh
* creating lib/my_app_web/live/post_live/show.ex
* creating lib/my_app_web/live/post_live/index.ex
* creating lib/my_app_web/live/post_live/form.ex
* creating test/my_app_web/live/post_live_test.exs
* creating lib/my_app/blog/post.ex
* creating priv/repo/migrations/20250916103816_create_posts.exs
* creating lib/my_app/blog.ex
* injecting lib/my_app/blog.ex
* creating test/my_app/blog_test.exs
* injecting test/my_app/blog_test.exs
* creating test/support/fixtures/blog_fixtures.ex
* injecting test/support/fixtures/blog_fixtures.ex

Add the live routes to your browser scope in lib/my_app_web/router.ex:

    live "/posts", PostLive.Index, :index
    live "/posts/new", PostLive.Form, :new
    live "/posts/:id", PostLive.Show, :show
    live "/posts/:id/edit", PostLive.Form, :edit

Ensure the routes are defined in a block that sets the `:current_scope` assign.

Remember to update your repository by running migrations:

    $ mix ecto.migrate
```

Follow the instructions in the docs _precisely_
to add the new routes to the _correct_ section
in `lib/my_app_web/router.ex`.

Before:

```elixir
  ## Authentication routes

  scope "/", MyAppWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{MyAppWeb.UserAuth, :require_authenticated}] do
      live "/users/settings", UserLive.Settings, :edit
      live "/users/settings/confirm-email/:token", UserLive.Settings, :confirm_email
    end

    post "/users/update-password", UserSessionController, :update_password
  end
```

After:

```elixir
  ## Authentication routes

  scope "/", MyAppWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{MyAppWeb.UserAuth, :require_authenticated}] do
      live "/users/settings", UserLive.Settings, :edit
      live "/users/settings/confirm-email/:token", UserLive.Settings, :confirm_email

      live "/posts", PostLive.Index, :index
      live "/posts/new", PostLive.Form, :new
      live "/posts/:id", PostLive.Show, :show
      live "/posts/:id/edit", PostLive.Form, :edit
    end

    post "/users/update-password", UserSessionController, :update_password
  end
```

> The exact change is:
> [phoenix-scopes/commit/b79b9cad](https://github.com/dwylx/phoenix-scopes/commit/b79b9cad2f1e80ad5e4e00498893133b6760111b#diff-3828157ee4f96c457294159c530cbbe444878213900c2ed88f0dddbc568f5ee5)

Next run the migration:

```sh
mix ecto.migrate
```

You should see output similar to the following:

```sh
11:38:23.288 [info] == Running 20250916103816 MyApp.Repo.Migrations.CreatePosts.change/0 forward

11:38:23.289 [info] create table posts

11:38:23.301 [info] create index posts_user_id_index

11:38:23.302 [info] == Migrated 20250916103816 in 0.0s
```

Run the App to confirm everything is working:

```sh
mix phx.server
```

```sh
[info] Running MyAppWeb.Endpoint with Bandit 1.8.0 at 127.0.0.1:4000 (http)
[info] Access MyAppWeb.Endpoint at http://localhost:4000
[watch] build finished, watching for changes...
≈ tailwindcss v4.1.7

/*! 🌼 daisyUI 5.0.35 */
Done in 111ms
```

No errors is a good sign.
Refresh http://localhost:4000 in your browser.
You should see that your previously authenticated session is still active:

<img src="https://github.com/user-attachments/assets/e84a4aa9-48b5-4472-8542-219a22421cf5" />

Good sign.

**Note**: if you see the following output in your terminal:

```sh
[info] GET /apple-touch-icon-precomposed.png
[debug] ** (Phoenix.Router.NoRouteError) no route found for GET /apple-touch-icon-precomposed.png (MyAppWeb.Router)
    (my_app 0.1.0) deps/phoenix/lib/phoenix/router.ex:465: MyAppWeb.Router.call/2
    (my_app 0.1.0) lib/my_app_web/endpoint.ex:1: MyAppWeb.Endpoint.plug_builder_call/2
    (my_app 0.1.0) deps/plug/lib/plug/debugger.ex:155: MyAppWeb.Endpoint."call (overridable 3)"/2
    (my_app 0.1.0) lib/my_app_web/endpoint.ex:1: MyAppWeb.Endpoint.call/2
    (phoenix 1.8.1) lib/phoenix/endpoint/sync_code_reload_plug.ex:22: Phoenix.Endpoint.SyncCodeReloadPlug.do_call/4
    (bandit 1.8.0) lib/bandit/pipeline.ex:131: Bandit.Pipeline.call_plug!/2
    (bandit 1.8.0) lib/bandit/pipeline.ex:42: Bandit.Pipeline.run/5
    (bandit 1.8.0) lib/bandit/http1/handler.ex:13: Bandit.HTTP1.Handler.handle_data/3
    (bandit 1.8.0) lib/bandit/delegating_handler.ex:18: Bandit.DelegatingHandler.handle_data/3
    (bandit 1.8.0) lib/bandit/delegating_handler.ex:8: Bandit.DelegatingHandler.handle_continue/2
    (stdlib 6.2) gen_server.erl:2335: :gen_server.try_handle_continue/3
    (stdlib 6.2) gen_server.erl:2244: :gen_server.loop/7
    (stdlib 6.2) proc_lib.erl:329: :proc_lib.init_p_do_apply/3

[info] GET /apple-touch-icon.png
[debug] ** (Phoenix.Router.NoRouteError) no route found for GET /apple-touch-icon.png (MyAppWeb.Router)
    (my_app 0.1.0) deps/phoenix/lib/phoenix/router.ex:465: MyAppWeb.Router.call/2
    (my_app 0.1.0) lib/my_app_web/endpoint.ex:1: MyAppWeb.Endpoint.plug_builder_call/2
    (my_app 0.1.0) deps/plug/lib/plug/debugger.ex:155: MyAppWeb.Endpoint."call (overridable 3)"/2
    (my_app 0.1.0) lib/my_app_web/endpoint.ex:1: MyAppWeb.Endpoint.call/2
    (phoenix 1.8.1) lib/phoenix/endpoint/sync_code_reload_plug.ex:22: Phoenix.Endpoint.SyncCodeReloadPlug.do_call/4
    (bandit 1.8.0) lib/bandit/pipeline.ex:131: Bandit.Pipeline.call_plug!/2
    (bandit 1.8.0) lib/bandit/pipeline.ex:42: Bandit.Pipeline.run/5
    (bandit 1.8.0) lib/bandit/http1/handler.ex:13: Bandit.HTTP1.Handler.handle_data/3
    (bandit 1.8.0) lib/bandit/delegating_handler.ex:18: Bandit.DelegatingHandler.handle_data/3
    (bandit 1.8.0) lib/bandit/delegating_handler.ex:8: Bandit.DelegatingHandler.handle_continue/2
    (stdlib 6.2) gen_server.erl:2335: :gen_server.try_handle_continue/3
    (stdlib 6.2) gen_server.erl:2244: :gen_server.loop/7
    (stdlib 6.2) proc_lib.erl:329: :proc_lib.init_p_do_apply/3
```

Don't worry, it's ... just a lack of icons.
It's safe to _ignore_ it if you're just speed-running through `Scopes`.
But if you want to _fix_ it, see:
[dwyl/learn-phoenix#163](https://github.com/dwyl/learn-phoenix/issues/163)

### 3.1 Test the Blog

Visiting 
[localhost:4000/posts](http://localhost:4000/posts/)
we see the following:

<img src="https://github.com/user-attachments/assets/df5399e0-8d40-4ade-b35d-0282d695cbfc" />

**Note**: if you attempt to view this page _without_ authenticating, <br />
you will be redirected with a message:
"_You must log in to access this page_."

<img src="https://github.com/user-attachments/assets/2acf5fd3-5f53-49a0-8bb4-f26d96755e16" />

If you haven't already followed the steps above to login, do that first.

### Create Blog Post

Input some text and click the "Save Post" button:

<img src="https://github.com/user-attachments/assets/4733343a-7092-4b4e-ac02-7a2518f6e184" />

<img src="https://github.com/user-attachments/assets/725ca2c8-65ad-4305-845f-60a6d6088b08" />

### 3.2 Read the Code

Now, let's look at the generated `LiveView`
(`lib/my_app_web/live/post_live/index.ex`):

```elixir
defmodule MyAppWeb.PostLive.Index do
  use MyAppWeb, :live_view

  alias MyApp.Blog

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <.header>
        Listing Posts
        <:actions>
          <.button variant="primary" navigate={~p"/posts/new"}>
            <.icon name="hero-plus" /> New Post
          </.button>
        </:actions>
      </.header>

      <.table
        id="posts"
        rows={@streams.posts}
        row_click={fn {_id, post} -> JS.navigate(~p"/posts/#{post}") end}
      >
        <:col :let={{_id, post}} label="Title">{post.title}</:col>
        <:col :let={{_id, post}} label="Body">{post.body}</:col>
        <:action :let={{_id, post}}>
          <div class="sr-only">
            <.link navigate={~p"/posts/#{post}"}>Show</.link>
          </div>
          <.link navigate={~p"/posts/#{post}/edit"}>Edit</.link>
        </:action>
        <:action :let={{id, post}}>
          <.link
            phx-click={JS.push("delete", value: %{id: post.id}) |> hide("##{id}")}
            data-confirm="Are you sure?"
          >
            Delete
          </.link>
        </:action>
      </.table>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Blog.subscribe_posts(socket.assigns.current_scope)
    end

    {:ok,
     socket
     |> assign(:page_title, "Listing Posts")
     |> stream(:posts, list_posts(socket.assigns.current_scope))}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(socket.assigns.current_scope, id)
    {:ok, _} = Blog.delete_post(socket.assigns.current_scope, post)

    {:noreply, stream_delete(socket, :posts, post)}
  end

  @impl true
  def handle_info({type, %MyApp.Blog.Post{}}, socket)
      when type in [:created, :updated, :deleted] do
    {:noreply, stream(socket, :posts, list_posts(socket.assigns.current_scope), reset: true)}
  end

  defp list_posts(current_scope) do
    Blog.list_posts(current_scope)
  end
end
```

Every function from the Blog context that we call
gets the current_scope assign passed in as the first argument.
The `list_posts/1` function then uses that information to properly filter posts:

```sh
# lib/my_app/blog.ex
def list_posts(%Scope{} = scope) do
  Repo.all(from post in Post, where: post.user_id == ^scope.user.id)
end
```

The `LiveView` even subscribes to scoped `PubSub` messages
and automatically updates the rendered list
whenever a new post is created
or an existing post is updated or deleted,
while ensuring that only messages for the current scope are processed.

### 3.3 `dbg(socket.assigns.current_scope)`

If you're curious what's in the `current_scope` struct, as I was,
add a call to
[`dbg()`](https://hexdocs.pm/elixir/debugging.html#dbg-2) 
to print it out in your terminal inside `mount/3` function:

```elixir
dbg(socket.assigns.current_scope)
```

You should see output similar to the following:

```sh
socket.assigns.current_scope #=> %MyApp.Accounts.Scope{
  user: #MyApp.Accounts.User<
    __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
    id: 2,
    email: "test@gmail.com",
    confirmed_at: ~U[2025-09-15 10:44:29Z],
    authenticated_at: ~U[2025-09-22 10:43:33Z],
    inserted_at: ~U[2025-09-15 10:44:04Z],
    updated_at: ~U[2025-09-15 10:44:29Z],
    ...
  >
}
```

## 4. Defining Scopes

This section corresponds to:
[hexdocs.pm/phoenix/1.8.1/scopes.html#defining-scopes](https://hexdocs.pm/phoenix/1.8.1/scopes.html#defining-scopes)
in the official docs.

The Phoenix generators use your app's config
to discover the available `scopes`.
A `scope` is defined by the following options:

```elixir
config :my_app, :scopes,
  user: [
    default: true,
    module: MyApp.Accounts.Scope,
    assign_key: :current_scope,
    access_path: [:user, :id],
    schema_key: :user_id,
    schema_type: :id,
    schema_table: :users,
    test_data_fixture: MyApp.AccountsFixtures,
    test_setup_helper: :register_and_log_in_user
  ]
```

In this example, the `scope` is called `user`
and it is the `default` `scope`
that is automatically used
when running
`mix phx.gen.schema`,
`mix phx.gen.context`,
`mix phx.gen.live`,
`mix phx.gen.html` and
`mix phx.gen.json`.
A `scope` needs a module that defines a struct,
in this case `MyApp.Accounts.Scope`.
Those structs are used as first argument
to the generated context functions, like `list_posts/1`.

* `default` - a boolean that indicates if this `scope` is the default `scope`.
  There can only be **one** default `scope` defined.

* `module` - the module that defines the **struct** for this scope.
  In our case: `lib/my_app/accounts/scope.ex`

* `assign_key` - the key where the scope struct is assigned to the
  [socket](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.Socket.html#t:t/0)
  or
  [conn](https://hexdocs.pm/plug/Plug.Conn.html).

* `access_path` - a list of keys that define the path
  to the identifying a field in the scope struct.
  The generators generate code like
  `where: schema_key == ^scope.user.id`.

* `route_prefix` - (optional) a path template string
  for how resources should be nested.
  For example, `/orgs/:org` would generate routes like `/orgs/:org/posts`.
  The parameter segment (`:org`) will be replaced
  with the appropriate scope access value in templates and `LiveViews`.

* `route_access_path` - (optional) list of keys
  that define the path to the field used in route generation
  (if `route_prefix` is set).
  This is particularly useful for user-friendly URLs
  where you might want to use a slug instead of an ID.
  If not specified, it defaults to
  `Enum.drop(scope.access_path, -1)` or `access_path`
  if the former is empty.
  For example, if the `access_path` is `[:organization, :id]`,
  it defaults to `[:organization]`,
  assuming that the value at `scope.organization`
  implements the `Phoenix.Param` protocol.

* `schema_key` - the foreign key that ties the resource to the scope.
  New scoped schemas are created with a foreign key field named `schema_key`
  of type `schema_type` to the `schema_table` table.

* `schema_type` - the type of the foreign key field in the schema.
  Typically `:id` or `:binary_id`.

* `schema_migration_type` (optional) - the type of the
  foreign key column in the database.
  Used for the generated migration.
  It defaults to the default migration foreign keytype.

* `schema_table` - the name of the table where the foreign key points to.

* `test_data_fixture` - a module that is automatically imported
  into the context test file.
  It must have a `NAME_scope_fixture/0` function
  that returns a unique scope struct for context tests,
  in this case `user_scope_fixture/0`.

* `test_setup_helper` - the name of a function that is registered as
  [`setup` callback](https://hexdocs.pm/ex_unit/ExUnit.Callbacks.html#setup/1)
  in LiveView / Controller tests.
  The function is expected to be imported in the test file.
  Usually, this is ensured by putting it into the `MyAppWeb.ConnCase` module.

While the `mix phx.gen.auth` automatically generates a scope,
scopes can also be defined manually.
This can be useful, for example, to retrofit an existing application with scopes
or to define scopes that are not tied to a user.

For this example, we will implement a custom scope
that gives each session its own scope.
While this might not be useful in most real-world applications
as created resources would be inaccessible as soon as the session ends,
it is a good example to understand how scopes work.
See the following section for an example on how to augment an existing scope
with organizations (teams, companies, or similar).

First, let's define our scope module `lib/my_app/scope.ex` (new file):

```elixir
defmodule MyApp.Scope do
  defstruct id: nil

  def for_id(id) do
    %MyApp.Scope{id: id}
  end
end
```

