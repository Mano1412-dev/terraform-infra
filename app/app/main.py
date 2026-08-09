from fastapi import FastAPI

app = FastAPI(
    title="ShopKart SRE Demo API",
    version="1.0.0"
)


@app.get("/health")
def health_check():
    return {
        "status": "UP",
        "service": "shopkart-api",
        "version": "1.0.0"
    }


@app.get("/")
def root():
    return {
        "message": "ShopKart API is running"
    }


@app.get("/api/products")
def get_products():
    return {
        "products": [
            {
                "id": 1,
                "name": "Rice",
                "price": 60
            },
            {
                "id": 2,
                "name": "Sugar",
                "price": 50
            },
            {
                "id": 3,
                "name": "Tomato",
                "price": 30
            }
        ]
    }