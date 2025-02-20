local must_env = std.native('must_env');
{
  components: [
    {
      deploy_source: {
        container_registry: {
          image: must_env('CONTAINER_REGISTRY_SERVER') + '/' + must_env('CONTAINER_REGISTRY_IMAGE'),
          password: must_env('CONTAINER_REGISTRY_PASSWORD'),
          server: must_env('CONTAINER_REGISTRY_SERVER'),
          username: 'apprun',
        },
      },
      env: [],
      max_cpu: '1',
      max_memory: '512Mi',
      name: 'web',
      probe: null,
    },
  ],
  max_scale: 1,
  min_scale: 0,
  name: 'my_web_app',
  port: 3000,
  timeout_seconds: 30,
}
