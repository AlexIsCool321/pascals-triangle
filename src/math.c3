module math;

struct Vec2
{
	union
	{
		float[2]	data;

		struct
		{
			union
			{
				float	x;
				float	r;
				float	u;
			}

			union
			{
				float	y;
				float	g;
				float	v;
			}
		}
	}
}


struct Vec3
{
	union
	{
		float[3]	data;

		struct
		{
			union
			{
				float	x;
				float	r;
				float	u;
			}

			union
			{
				float	y;
				float	g;
				float	v;
			}

			union
			{
				float	z;
				float	b;
			}
		}
	}
}


struct Vec4
{
	union
	{
		float[4]	data;

		struct
		{
			union
			{
				float	x;
				float	r;
				float	u;
			}

			union
			{
				float	y;
				float	g;
				float	v;
			}

			union
			{
				float	z;
				float	b;
			}

			union
			{
				float	w;
				float	a;
			}
		}
	}
}