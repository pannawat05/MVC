const url = "http://localhost:3000/api/login";

export async function login(username, password) {
    try {
        const response = await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ username, password })
        });

        if (!response.ok) {
            // handle non-2xx HTTP codes
            const errorText = await response.text();
            throw new Error(`HTTP ${response.status}: ${errorText}`);
        }

        const data = await response.json();
        return data;
    } catch (error) {
        console.error("Login request failed:", error);
        return { success: false, message: "Unable to connect to server." };
    }
}
