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

           78 ground-col-count value 10.
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
