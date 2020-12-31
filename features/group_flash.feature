Feature: Group Flashing
    In a group flashing characteristic, a group of a specific number of flashes are repeated regularly.
    As with a normal flashing characteristic, the light is on for a brief period, then off for a longer period.
    There then follows a longer dark period before the pattern repeats again.

    Scenario: Fl(3)
     When I request an image with the characteristic Fl(3) R 10s
     Then the first frame is red for 0.5 seconds
     And the next frame is transparent for 1 second
     And the next frame is red for 0.5 seconds
     And the next frame is transparent for 1 second
     And the next frame is red for 0.5 seconds
     And the next frame is transparent for 6.5 seconds

    Scenario: Fl(3+1)
        In a composite group flash, there are two grouped patterns separated by a longer period of darkness.
        The "spare" time between groups is evenly distributed.

     When I request an image with the characteristic Fl(3+1) G 15s
     Then the first frame is green for 0.5 seconds
     And the next frame is transparent for 1 second
     And the next frame is green for 0.5 seconds
     And the next frame is transparent for 1 second
     And the next frame is green for 0.5 seconds
     And the next frame is transparent for 5.5 seconds
     And the next frame is green for 0.5 seconds
     And the next frame is transparent for 5.5 seconds
