<script>
    import Nav from "../../components/Nav.svelte";
    import { login } from "../../Control/login.js";

    let username = "";
    let password = "";
    let loading = false;

    async function handleSubmit(event) {
        event.preventDefault();
        loading = true;

        try {
            const data = await login(username, password);
            if (data.success) {
                localStorage.setItem("token", data.token);
                alert("Login successful!");
                window.location.href = "/home";
            } else {
                alert("Login failed: " + data.message);
            }
        } catch (error) {
            console.error("Error during login:", error);
            alert("An error occurred during login. Please try again later.");
        } finally {
            loading = false;
        }
    }
</script>

<Nav />

<h1>Login</h1>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <!-- attach handler on form submit -->
            <form on:submit={handleSubmit}>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input 
                        type="text" 
                        class="form-control" 
                        id="username" 
                        placeholder="Enter username" 
                        bind:value={username}
                        required
                    />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input 
                        type="password" 
                        class="form-control" 
                        id="password" 
                        placeholder="Enter password" 
                        bind:value={password}
                        required
                    />
                </div>
                <button type="submit" class="btn btn-primary" disabled={loading}>
                    {loading ? "Logging in..." : "Login"}
                </button>
            </form>
        </div>
    </div>
</div>

<style>
    h1 {
        color: blue;
        margin: 0 auto;
        text-align: center;
    }
    .container {
        margin-top: 2rem;
    }
</style>
