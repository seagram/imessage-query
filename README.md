# imessage-query

A CLI for querying iMessage data from the iMessage SQLite database in MacOS.

## Usage

```
imessage-query [command] [flags]
```

### Commands

```
search # Returns messages containing given keyword
contacts # Returns JSONL of all contacts
export # Returns JSONL of iMessage conversation
```

### Flags
```
--contact <phone-number>
--date-from <ISO 8601 date>
--date-to <ISO 8601 date>
--limit <n>
--is-from-me # Only sent messages
```

## Notes
- Requires Full Disk Access
- MacOS uses Mac absolute time (2001-01-01) instead of EPOCH.

## Roadmap
- [ ] Support for different output formats (JSON, JSONL, CSV, TXT)
- [ ] Media support (images/videos)
- [ ] Export to file
