<%-- 
    Document   : search
    Created on : Dec 31, 2023, 12:01:21 AM
    Author     : Denis
'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'
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>OpenAI Search</title>
    <script>
        const apiKey ='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' ; // Replace with your API key

        function performSearch() {
            const searchQuery = document.getElementById('searchQuery').value;

            fetch('https://api.openai.com/v1/engines/davinci/search', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${apiKey}`,
                },
                body: JSON.stringify({
                    query: searchQuery,
                    // Other parameters if needed
                }),
            })
            .then(response => response.json())
            .then(data => {
                // Process and display search results on your webpage
                console.log(data);
                // Handle displaying results in HTML here
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    </script>
</head>
<body>
    <input type="text" id="searchQuery" placeholder="Enter search query">
    <button onclick="performSearch()">Search</button>
</body>
</html>
