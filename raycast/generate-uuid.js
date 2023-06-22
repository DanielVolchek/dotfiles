#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Generate UUID
// @raycast.mode compact

// Optional parameters:
// @raycast.icon 🤖

function generateUUID(count = 13) {
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWZY'

    let str = ""
    for (let i = 0; i < count; i++) {
        const rand = Math.floor(Math.random() * count)
        str += chars[rand]
    }
    return str
}

console.log(generateUUID())