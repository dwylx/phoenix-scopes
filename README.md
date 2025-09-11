<div align="center">

# Phoenix 1.8 `Scopes` Walkthrough

</div>

This repo is a quick walkthrough of `Phoenix 1.8 scopes`
following the official docs:
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