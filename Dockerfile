FROM elixir:1.11.2
RUN useradd -m -U -u 1000 graphql
RUN mkdir -p /opt/graphql
RUN chown -R 1000:1000 /opt/graphql
RUN apt-get update && \
  apt-get install -y postgresql-client-11 inotify-tools && \
  apt-get clean
USER graphql
VOLUME /opt/graphql
WORKDIR /opt/graphql

CMD bash -lc "mix local.hex --force && mix local.rebar --force && mix deps.get && mix ecto.setup && elixir --sname graphql --cookie graphql_D3V_oreos -S mix phx.server"
