Feature: Simple Flash
    A flash, Fl, is a brief period of light, followed by a longer period of darkness.

    Scenario Outline: Flashing Period <character>
        The period of a flashing characteristic is the total time of the sequence.
        A flash is 1 second long, so the dark period is one second shorter than
        the total period.

        When I request an image with the characteristic <character>
        Then the first frame is <colour> for 1 second
        And the next frame is transparent for <dark_period> seconds

    Examples:
    | character | colour  | dark_period |
    | Fl W 5    | white   |  4          |
    | Fl R 10   | red     |  9          |
    | Fl G 4    | green   |  3          |
    | Fl Y 8    | yellow  |  7          |

    Scenario: Illegal Flash
        As a flash is one second, a cycle of 2 seconds or less is impossible.

        When I request an image with the characteristic Fl 2
        Then the request fails
