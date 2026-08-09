from fastapi.testclient import TestClient

from app.main import app


client = TestClient(app)


def test_health():
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json()["status"] == "UP"


def test_products():
    response = client.get("/api/products")

    assert response.status_code == 200
    assert len(response.json()["products"]) == 3