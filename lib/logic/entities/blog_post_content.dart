class BlogPostContent {
  final String textContent;
  final String? videoPath;
  final String? imagePath;
  final String? subTitle;
  const BlogPostContent({
    required this.textContent,
    this.videoPath,
    this.imagePath,
    this.subTitle,
  });
}
