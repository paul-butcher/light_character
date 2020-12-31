Feature: Fixed Lights
    The Fixed pattern, F, is an always-on light in the given colour.

    Scenario: Default white fixed light
        When I request an image with the characteristic F
        Then the image is a fixed white light

    Scenario Outline: Explicit fixed <name> light
        When I request an image with the characteristic <character>
        Then the image is a fixed <name> light
    Examples:
    | character | name   |
    | F W       | white  |
    | F R       | red    |
    | F G       | green  |
    | F Y       | yellow |
