<script>
   import Nav from "../../components/Nav.svelte";
    import { fetchsuggtionJobs } from "../../Control/jobs.js";
    import { onMount } from "svelte";

    let jobs = [];

    onMount(async () => {
        jobs = await fetchsuggtionJobs();
    });
</script>

<Nav />
<h2>Suggested Jobs</h2>
{#each jobs as job}
    <div>
        <h3>{job.title}</h3>
        <p>Salary: {job.detail}</p>
    </div>
{/each}
