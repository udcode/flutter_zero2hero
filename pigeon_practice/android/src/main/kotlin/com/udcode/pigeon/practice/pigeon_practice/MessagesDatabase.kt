package com.udcode.pigeon.practice.pigeon_practice

import Message
import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

class MessagesDatabase(context: Context) : SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION) {

    companion object {
        private const val DATABASE_NAME = "messages.db"
        private const val DATABASE_VERSION = 1
        private const val TABLE_MESSAGES = "messages"

        // Column names
        private const val COLUMN_ID = "id"
        private const val COLUMN_CONTENT = "content"
        private const val COLUMN_SENDER = "sender"
        private const val COLUMN_TIMESTAMP = "timestamp"
        private const val COLUMN_STATUS = "status"
    }

    override fun onCreate(db: SQLiteDatabase) {
        val createTable = """
            CREATE TABLE $TABLE_MESSAGES (
                $COLUMN_ID TEXT PRIMARY KEY,
                $COLUMN_CONTENT TEXT,
                $COLUMN_SENDER TEXT,
                $COLUMN_TIMESTAMP INTEGER,
                $COLUMN_STATUS TEXT
            )
        """.trimIndent()

        db.execSQL(createTable)
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS $TABLE_MESSAGES")
        onCreate(db)
    }

    fun saveMessage(message: Message) {
        val values = ContentValues().apply {
            put(COLUMN_ID, message.id)
            put(COLUMN_CONTENT, message.content)
            put(COLUMN_SENDER, message.sender)
            put(COLUMN_TIMESTAMP, message.timestamp)
            put(COLUMN_STATUS, message.status)
        }

        val db = writableDatabase
        db.insertWithOnConflict(
            TABLE_MESSAGES,
            null,
            values,
            SQLiteDatabase.CONFLICT_REPLACE
        )
    }

    fun getAllMessages(): List<Message> {
        val messages = mutableListOf<Message>()
        val db = readableDatabase

        val cursor = db.query(
            TABLE_MESSAGES,
            null,
            null,
            null,
            null,
            null,
            "$COLUMN_TIMESTAMP DESC"
        )

        cursor?.use {
            val idIndex = it.getColumnIndex(COLUMN_ID)
            val contentIndex = it.getColumnIndex(COLUMN_CONTENT)
            val senderIndex = it.getColumnIndex(COLUMN_SENDER)
            val timestampIndex = it.getColumnIndex(COLUMN_TIMESTAMP)
            val statusIndex = it.getColumnIndex(COLUMN_STATUS)

            while (it.moveToNext()) {
                val message = Message(
                    id = it.getString(idIndex),
                    content = it.getString(contentIndex),
                    sender = it.getString(senderIndex),
                    timestamp = it.getLong(timestampIndex),
                    status = it.getString(statusIndex)
                )
                messages.add(message)
            }
        }

        return messages
    }

    fun deleteMessage(messageId: String) {
        val db = writableDatabase
        db.delete(
            TABLE_MESSAGES,
            "$COLUMN_ID = ?",
            arrayOf(messageId)
        )
    }

    fun clearAllMessages() {
        val db = writableDatabase
        db.delete(TABLE_MESSAGES, null, null)
    }
}