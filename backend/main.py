from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from database import Base, engine
from routers.user.user_routers import router as user_router

app = FastAPI()

# Configure CORS to allow access
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    # Indicates whether the server can respond to requests with the headers
    allow_credentials=True,
    # List of authorised HTTP methods (for example, GET, POST, etc.)
    allow_methods=["GET", "POST", "PUT", "DELETE"],
    # List of authorised HTTP headers
    allow_headers=["*"],
)

app.include_router(user_router)

Base.metadata.create_all(bind=engine)

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)  # nosec
