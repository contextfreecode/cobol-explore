           01 control-fields.
               05 control-down-flag pic x value space.
                   88 control-down value 'Y'.
               05 control-left-flag pic x value space.
                   88 control-left value 'Y'.
               05 control-right-flag pic x value space.
                   88 control-right value 'Y'.
               05 control-up-flag pic x value space.
                   88 control-up value 'Y'.

           01 done-flag pic x value space.
               88 done value 'Y'.

           01 event-found binary-long value 0.
           01 event-fields.
               05 event-left-flag pic x value space.
                   88 event-left value 'Y'.
               05 event-right-flag pic x value space.
                   88 event-right value 'Y'.

           78 ground-col-count value 9.
           78 ground-row-count value 30.
           78 ground-row-show-count value 12.
           01 ground-gen pic x value space.
               88 ground-gen-empty value ' '.
               88 ground-gen-solid value 'S'.
           01 ground-col-index binary-long.
           01 ground-row-index binary-long value 1.
           01 ground-render-col-index binary-long.
           01 ground-render-row-index binary-long.
           01 ground-render-row-start binary-long value 10.
           01 ground-rows occurs ground-row-count times.
               05 ground-cells occurs ground-col-count times.
                   10 ground-cell pic x.
                       88 ground-solid value 'S'.

           01 ground-render-offset-y binary-long value 0.

           01 random-value float-long.

           01 collision-offset.
               05 collision-offset-x binary-long.
               05 collision-offset-y binary-long.
           01 collision-flag pic x value ' '.
               88 collision value 'Y'.
           01 collision-free-time binary-long value 0.
           78 collision-inset value 30.

           01 speed binary-long value 1.

           01 stats.
               05 distance binary-long.
               05 distance-old binary-long.
               05 score pic 9(9)v9(2) packed-decimal.
               05 decimal-time pic 9(9)v9(2) packed-decimal.

           01 mode-flag pic x value 'i'.
               88 mode-init value 'i'.
               88 mode-play value 'p'.
               88 mode-finish value 'f'.

           01 frame-start binary-long.
           01 frame-time binary-long.
