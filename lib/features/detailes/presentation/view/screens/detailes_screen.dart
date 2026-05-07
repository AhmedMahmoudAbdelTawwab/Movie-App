import 'package:flutter/material.dart';
import 'package:movie_app/features/detailes/data/model/details_dto.dart';

class DetailsView extends StatelessWidget {
  final DetailsDto _detailsDto;

  const DetailsView(this._detailsDto, {super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = _detailsDto.posterPath ?? "";
    String fullImageUrl = imageUrl.startsWith("http")
        ? imageUrl
        : "https://image.tmdb.org/t/p/w500$imageUrl";

    return Scaffold(
      backgroundColor: const Color(0xFF1E262F),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(fullImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                          Colors.transparent,
                          const Color(0xFF1E262F),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Text(
                    "Detail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),

                Positioned(
                  top: 210,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        fullImageUrl,
                        width: 110,
                        height: 160,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 110,
                          height: 160,
                          color: Colors.grey[800],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 315,
                  left: 145,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _detailsDto.title ?? "Unknown Title",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 22,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            _detailsDto.voteAverage != 0
                                ? "${_detailsDto.voteAverage}"
                                : "N/A",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _detailsDto.releaseDate?.split('-')[0] ?? "2024",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 25),
                  const Icon(Icons.access_time, color: Colors.grey, size: 18),
                  const SizedBox(width: 5),
                  const Text(
                    "148 Minutes",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 25),
                  const Icon(Icons.local_movies, color: Colors.grey, size: 18),
                  const SizedBox(width: 5),
                  const Text("Action", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _detailsDto.overview != null && _detailsDto.overview!.isNotEmpty
                    ? _detailsDto.overview!
                    : "No Description available for this movie.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "similar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  "More movies coming soon...",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
