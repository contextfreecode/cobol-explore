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
