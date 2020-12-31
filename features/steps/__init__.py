from io import BytesIO
from behave import *
from PIL import Image, ImageColor

from light_character.light_character import save_characteristic_as_image


use_step_matcher('re')


@when(u'I request an image with the characteristic (?P<characteristic>.+)')
def request_image(context, characteristic):
    buffer = BytesIO()
    try:
        save_characteristic_as_image(characteristic, (1, 1), buffer)
        buffer.seek(0)
        context.image = Image.open(buffer)
    except ValueError as e:
        context.exception = e


@then(u'the image is a fixed (white|red|green|yellow) light')
def fixed_light(context, colour):
    assert_frame_colour(context.image, colour)
    try:
        context.image.seek(1)
    except EOFError:
        return
    assert False


@then(u'the first frame is (?P<colour>white|red|green|yellow|transparent) for (?P<duration>[.?\d]+) seconds?')
def first_frame(context, colour, duration):
    context.image.seek(0)
    assert_frame_colour(context.image, colour)
    assert_frame_duration(context.image, duration)


@then(u'the next frame is (?P<colour>white|red|green|yellow|transparent) for (?P<duration>[.?\d]+) seconds?')
def next_frame(context,  colour, duration):
    context.image.seek(context.image.tell() + 1)
    assert_frame_colour(context.image, colour)
    assert_frame_duration(context.image, duration)


@then(u'the request fails')
def step_impl(context):
    assert isinstance(context.exception, ValueError)


def assert_frame_duration(frame, duration):
    duration = round(float(duration), 2) * 1000
    try:
        assert frame.info['duration'] == duration
    except AssertionError:
        print(frame.info['duration'], duration)
        raise


def assert_frame_colour(frame, colour):
    # the HTML colour 'green' is a dull mid-green (#008000)
    # The appropriate colour for a light (#00ff00) is called 'lime'
    colour = 'lime' if colour.lower() == 'green' else colour.replace(' ', '').lower()
    rgba = frame.convert('RGBA').getpixel((0, 0))
    assert rgba[:3] == ImageColor.getrgb(colour) if colour != 'transparent' else (0,0,0)
    if colour == 'transparent':
        assert rgba[3] == 0
    else:
        assert rgba[3] != 0
