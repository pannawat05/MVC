
const url = "http://localhost:3000/api/jobs";

export async function fetchsuggtionJobs(limit = 5) {
    const response = await fetch(url);
    const data = await response.json();
    return data.slice(0, limit);
}

export async function fetchAllJobs() {
    const response = await fetch(url);
    const data = await response.json();
    return data;
}

export async function getjobsdetail(id) {
    const response = await fetch(url);
    const data = await response.json();
    return data.find(job => job.id === id);
}   