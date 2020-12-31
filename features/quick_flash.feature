Feature: Quick Flash
    Quick flashes (Q) flash more than 50 times per minute

    Scenario Outline: Quick Flash Period <character>
        The period of a flashing characteristic is the total time of the sequence.
        A quick flash is 0.25 seconds long, so the dark period is a quarter of a second
        shorter than the total period.

        When I request an image with the characteristic <character>
        Then the first frame is <colour> for 0.25 seconds
        And the next frame is transparent for 0.75 seconds

    Examples:
    | character  | colour  |
    | Q W        | white   |
    | Q R        | red     |
    | Q G        | green   |
    | Q Y        | yellow  |


    Scenario: Illegal Quick Flash - continuous with period
        A simple Quick flash has no period

        When I request an image with the characteristic Q. 1
        Then the request fails
