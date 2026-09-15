extern s32 event_stop;

/* EdEventStopPlay (void) */
void EdEventStopPlay__Fv(void) {
    event_stop = (event_stop == 0) & 0xFF;
}
