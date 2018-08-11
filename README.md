# Idvote

- Install Elixir: https://elixir-lang.org/install.html
- Start Docker: `docker-compose up -d`
- Copy `.env.example` to `.env`: `cp .env.example .env`
  - Tweak default environment variables as needed
- Install deps: `env $(cat .env | xargs) mix deps.get`
- Run migration: `env $(cat .env | xargs) mix ecto.reset`
- Start Phoenix: `env $(cat .env | xargs) mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## License
ISC, 2018, Code for America