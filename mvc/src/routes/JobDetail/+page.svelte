<script>
    import Nav from "../../components/Nav.svelte";
    import { fetchJobDetail } from "../../control/jobs.js";
    import { page } from "$app/stores"; // SvelteKit store

    // create a promise for job detail
    let jobPromise = fetchJobDetail($page.params.id);
</script>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Job detail</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <h2>Job Detail</h2>

{#await jobPromise}
    <p>Loading job details...</p>
{:then job}
    <div>
        <h3>{job.title}</h3>
        <p>Salary: {job.detail}</p>
        <p>Deadline: {job.deadline}</p>
        <p>Status: {job.status == 1 ? "available" : "closed"}</p>
        <button>Apply now!</button>
    </div>
{:catch error}
    <p>Error loading job details: {error.message}</p>
{/await}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>