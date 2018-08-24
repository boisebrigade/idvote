import ApolloClient from 'apollo-boost';

const connectionString = () => {
  const port = typeof process.env.PORT !== 'undefined' ? +process.env.PORT : 4000;
  const protocol = port === 443 ? 'https' : 'http';
  const host = typeof process.env.HOST !== 'undefined' ? process.env.HOST: 'localhost';

  return `${protocol}://${host}:${port}/api/graphql`
}

export default new ApolloClient({
  uri: connectionString()
});
