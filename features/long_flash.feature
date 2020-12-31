Feature: Long Flash
    Long flashes (Lfl) are light for two seconds or more

    Scenario Outline: Long Flash Period <character>
        The period of a flashing characteristic is the total time of the sequence.
        A long flash is 2 seconds long, so the dark period is two seconds shorter than
        the total period.

        When I request an image with the characteristic <character>
        Then the first frame is <colour> for 2 seconds
        And the next frame is transparent for <dark_period> seconds

    Examples:
    | character   | colour  | dark_period |
    | L.Fl W 5    | white   |  3          |
    | L.Fl R 10   | red     |  8          |
    | L.Fl G 7    | green   |  5          |
    | L.Fl Y 8    | yellow  |  6          |
