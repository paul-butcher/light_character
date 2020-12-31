Feature: Isophase Lights
    Isophase lights (Iso) are equally dark and light

    Scenario Outline: Isophase Period <character>
        The cycle period of an isophase light is divided evenly between the light and dark
        periods

        When I request an image with the characteristic <character>
        Then the first frame is <colour> for <period> seconds
        And the next frame is transparent for <period> seconds

    Examples:
    | character  | colour  | period |
    | Iso W 6    | white   |  3     |
    | Iso R 10   | red     |  5     |
    | Iso G 7    | green   |  3.5   |
    | Iso Y 8    | yellow  |  4     |
