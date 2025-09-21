<script>
    import Nav from "../../components/Nav.svelte"
    import { fetchAllJobs } from "../../Control/jobs.js";
    let jobs = [];
    fetchAllJobs().then(data => {
        jobs = data;
    });
</script>
<Nav />
<h2>all jobs</h2>
{#each jobs as job}
    <div>
        <h3 data-bs-toggle="modal" data-bs-target="#exampleModal">{job.title}</h3>
        <p>Salary: {job.detail}</p>
    </div>
{/each}


<button type="button" class="btn btn-primary" >
job detail
</button>