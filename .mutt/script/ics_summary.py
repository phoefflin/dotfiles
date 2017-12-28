#!/usr/bin/env python3
# calendar_summary: provide simple CSV summary of calendar events in .ics file.
#
# Developed on python3.5 with:
#
#     pip install click icalendar pytz
#
# Save calendar.ics from:
#
#     Google Calendar: Calendar Settings > Calendar Details > Export Calendar
#
# Example invocation:
#
#     python3 calendar_summary.py --tz US/Eastern calendar.ics > calendar.csv

import csv
import datetime
import sys

import click
import icalendar
import pytz


def summarize(reader, writer, tz=None):
    tzinfo = pytz.timezone(tz) if tz is not None else None

    for event in icalendar.Calendar.from_ical(reader.read()).subcomponents:
        summary = event.get('SUMMARY', '')
        dtstart = event.get('DTSTART', None)
        if dtstart is not None:
            dtstart = dtstart.dt
            if isinstance(dtstart, datetime.datetime) and tzinfo is not None:
                dtstart = dtstart.astimezone(tzinfo)

        attendees = []
        for attendee in event.get('ATTENDEE', []):
            attendee = str(attendee)
            if attendee.startswith('mailto:'):
                attendee = attendee[7:]
            attendees.append(attendee)

        record = [summary, dtstart]
        record.extend(attendees)
        writer.writerow(record)


@click.command()
@click.argument('filepath_ics')
@click.option('--tz')
def summarize_ics(filepath_ics, writer=None, tz=None):
    if writer is None:
        writer = csv.writer(sys.stdout)
    return summarize(open(filepath_ics), writer=writer, tz=tz)


if __name__ == '__main__':
    summarize_ics()
