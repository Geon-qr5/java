// script.js
document.addEventListener('DOMContentLoaded', () => {
    const button = document.getElementById('addMessageBtn');
    const messagesDiv = document.getElementById('messages');
    let messageCount = 0;

    button.addEventListener('click', () => {
        messageCount++;
        const newMessage = document.createElement('div');
        newMessage.className = 'message';
        newMessage.textContent = `메시지 ${messageCount}`;
        messagesDiv.appendChild(newMessage);
    });
});
