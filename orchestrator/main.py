from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uuid

app = FastAPI(title="QE Brain Orchestrator")

class RunDescriptor(BaseModel):
    release_notes: str

runs = {}

@app.post("/runs")
def create_run(desc: RunDescriptor):
    run_id = str(uuid.uuid4())
    runs[run_id] = {"status": "created", "release_notes": desc.release_notes}
    return {"run_id": run_id, "status": "created"}

@app.get("/runs/{run_id}")
def get_run(run_id: str):
    if run_id not in runs:
        raise HTTPException(status_code=404, detail="Run not found")
    return runs[run_id]

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5000)
