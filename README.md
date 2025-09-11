<div align="center">

# Phoenix 1.8 `Scopes` Walkthrough

</div>

This repo is a quick walkthrough of `Phoenix 1.8 scopes`
following the official docs:
[hexdocs.pm/phoenix/1.8.1/scopes.html])(https://hexdocs.pm/phoenix/1.8.1/scopes.html)

## 0. Prerequisites

Ensure you have `Elixir`, `Phoenix` and `Postgres` installed.
If you don't please see:

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
