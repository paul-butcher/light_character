Feature: Occulting
    An occulting pattern (Oc) is basically the inverse of a flash. A short period
    of darkness with a longer period of light.

    Scenario Outline: Occulting characteristic <character>
        The period of a characteristic is the total time of the sequence.

        A dark period is 1 second long, so the light period is one second shorter than
        the total period.

        When I request an image with the characteristic <character>
        Then the first frame is transparent for 1 second
        And the next frame is <colour> for <light_period> second

    Examples:
    | character | colour  | light_period |
    | Oc W 5    | white   |  4           |
    | Oc R 10   | red     |  9           |
    | Oc G 4    | green   |  3           |
    | Oc Y 8    | yellow  |  7           |
