TABLE handle (
    ROWID INTEGER PRIMARY KEY AUTOINCREMENT,
    id TEXT NOT NULL,
    country TEXT,
    service TEXT
);

TABLE chat (
    ROWID INTEGER PRIMARY KEY AUTOINCREMENT,
    guid TEXT NOT NULL UNIQUE,
    style INTEGER,
    state INTEGER,
    account_id TEXT,
    properties BLOB,
    chat_identifier TEXT,
    service_name TEXT,
    room_name TEXT,
    account_login TEXT,
    is_archived INTEGER DEFAULT 0,
    last_addressed_handle TEXT,
    display_name TEXT,
    group_id TEXT,
    is_filtered INTEGER DEFAULT 0
);

TABLE message (
    ROWID INTEGER PRIMARY KEY AUTOINCREMENT,
    guid TEXT NOT NULL UNIQUE,
    text TEXT,
    replace TEXT,
    service_center TEXT,
    handle_id INTEGER,
    subject TEXT,
    country TEXT,
    attributedBody BLOB,
    version INTEGER,
    type INTEGER,
    service TEXT,
    account TEXT,
    account_guid TEXT,
    error INTEGER DEFAULT 0,
    date INTEGER,
    date_read INTEGER,
    date_delivered INTEGER,
    is_delivered INTEGER DEFAULT 0,
    is_finished INTEGER DEFAULT 0,
    is_emote INTEGER DEFAULT 0,
    is_from_me INTEGER DEFAULT 0,
    is_empty INTEGER DEFAULT 0,
    is_delayed INTEGER DEFAULT 0,
    is_auto_reply INTEGER DEFAULT 0,
    is_prepared INTEGER DEFAULT 0,
    is_read INTEGER DEFAULT 0,
    is_system_message INTEGER DEFAULT 0,
    is_sent INTEGER DEFAULT 0,
    has_dd_results INTEGER DEFAULT 0,
    is_service_message INTEGER DEFAULT 0,
    is_forward INTEGER DEFAULT 0,
    was_downgraded INTEGER DEFAULT 0,
    is_archive INTEGER DEFAULT 0,
    cache_has_attachments INTEGER DEFAULT 0,
    cache_roomnames TEXT,
    was_data_detected INTEGER DEFAULT 0,
    was_deduplicated INTEGER DEFAULT 0,
    is_audio_message INTEGER DEFAULT 0,
    date_played INTEGER,
    item_type INTEGER,
    other_handle INTEGER,
    group_title TEXT,
    group_action_type INTEGER,
    share_status INTEGER,
    share_direction INTEGER,
    is_expirable INTEGER DEFAULT 0,
    expire_state INTEGER DEFAULT 0,
    message_action_type INTEGER DEFAULT 0,
    message_source INTEGER DEFAULT 0,
    FOREIGN KEY(handle_id) REFERENCES handle(ROWID)
);

TABLE attachment (
    ROWID INTEGER PRIMARY KEY AUTOINCREMENT,
    guid TEXT NOT NULL UNIQUE,
    created_date INTEGER,
    start_date INTEGER,
    filename TEXT,
    uti TEXT,
    mime_type TEXT,
    transfer_state INTEGER,
    is_outgoing INTEGER DEFAULT 0,
    user_info BLOB,
    transfer_name TEXT,
    total_bytes INTEGER,
    is_sticker INTEGER DEFAULT 0,
    sticker_user_info BLOB,
    attribution_info BLOB,
    hide_attachment INTEGER DEFAULT 0
);

TABLE chat_handle_join (
    chat_id INTEGER NOT NULL,
    handle_id INTEGER NOT NULL,
    PRIMARY KEY (chat_id, handle_id),
    FOREIGN KEY(chat_id) REFERENCES chat(ROWID) ON DELETE CASCADE,
    FOREIGN KEY(handle_id) REFERENCES handle(ROWID) ON DELETE CASCADE
);

TABLE chat_message_join (
    chat_id INTEGER NOT NULL,
    message_id INTEGER NOT NULL,
    message_date INTEGER,
    PRIMARY KEY (chat_id, message_id),
    FOREIGN KEY(chat_id) REFERENCES chat(ROWID) ON DELETE CASCADE,
    FOREIGN KEY(message_id) REFERENCES message(ROWID) ON DELETE CASCADE
);

TABLE message_attachment_join (
    message_id INTEGER NOT NULL,
    attachment_id INTEGER NOT NULL,
    PRIMARY KEY (message_id, attachment_id),
    FOREIGN KEY(message_id) REFERENCES message(ROWID) ON DELETE CASCADE,
    FOREIGN KEY(attachment_id) REFERENCES attachment(ROWID) ON DELETE CASCADE
);
