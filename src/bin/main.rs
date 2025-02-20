use axum::{routing::get, Json, Router};
use serde::Serialize;
use std::env;

#[derive(Serialize)]
struct Version {
    created: Option<String>,
    revision: Option<String>,
    branch: Option<String>,
}

#[tokio::main(flavor = "current_thread")]
async fn main() {
    let app = Router::new()
        .route("/", get(|| async { "Hello, World!" }))
        .route("/version", get(version));

    // run our app with hyper, listening globally on port 3000
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn version() -> Json<Version> {
    Json(Version {
        created: env::var("IMAGE_CREATED").ok(),
        revision: env::var("IMAGE_REVISION").ok(),
        branch: env::var("IMAGE_BRANCH").ok(),
    })
}
