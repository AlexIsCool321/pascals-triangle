module triangle;

import std;

import math;

import glfw;
import gl;

const uint TRIANGLE_HEIGHT	= 100;
const float MARGIN			= 0.1;

fn int pascal_value (uint row, uint column)
{
	int value = 1;

	for (uint k = 0; k < column; k++)
	{
		value = value * (int)(row - k) / (int)(k + 1);
	}

	return value;
}

fn int main(String[] args)
{
	if (!glfw::init())
	{
		return 1;
	}

	Window window = glfw::create_window("Pascal's Triangle", 500, 500);

	for ( ;; )
	{
		window.poll_events();
		if (window.should_close()) { break; }

		gl::resize_viewport (window.size);
		gl::clear ((math::Vec4){.r = 0, .g = 0, .b = 0, .a = 0});

		for (uint y = 0; y < TRIANGLE_HEIGHT; y++)
		{
			for (uint x = 0; x < TRIANGLE_HEIGHT; x++)
			{
				math::Vec2 position =
				{
					.x	= x,
					.y	= y
				};

				math::Vec3 color =
				{
					.r = (float)x / TRIANGLE_HEIGHT,
					.g = (float)y / TRIANGLE_HEIGHT,
					.b = 0
				};

				for (int i = 0; i < 2; i++) { position.data[i] /= (float)TRIANGLE_HEIGHT; }
				for (int i = 0; i < 2; i++) { position.data[i] *= 2; }
				for (int i = 0; i < 2; i++) { position.data[i] -= 1; }

				for (int i = 0; i < 2; i++) { position.data[i] *= 1 - MARGIN; }

				float pixel_size = window.size.y / TRIANGLE_HEIGHT;
				pixel_size *= 1 - MARGIN;

				if (pascal_value(x, y) % 2 == 1)
				{
					gl::set_pixel (position, color, pixel_size);
				}
			}
		}

		window.swap_buffers();
	}

	window.destroy();
	glfw::terminate();

	return 0;
}
