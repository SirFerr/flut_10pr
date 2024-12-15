import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeImages extends StatelessWidget {
  const RecipeImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMtt3aOrfYZ1KnQq4GK0vf9gkNBC07f72UWQ&s'),
          _buildImage('https://images.theconversation.com/files/607554/original/file-20240717-17-a2w33d.jpg?ixlib=rb-4.1.0&rect=46%2C34%2C3811%2C2533&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip'),
          _buildImage('https://media.cnn.com/api/v1/images/stellar/prod/220511094011-01-body-fried-foods-churros.jpg?q=w_1110,c_fill'),
          _buildImage('https://i0.wp.com/www.drdavidludwig.com/wp-content/uploads/2017/01/1-RIS_6IbCLYv1X3bzYW1lmA.jpeg?fit=800%2C552&ssl=1'),
          _buildImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG5hxs8nAQLFk0DQ-nmREiLyQKy2GuL_sozw&s'),
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: url,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 150,
        width: 150,
      ),
    );
  }
}
