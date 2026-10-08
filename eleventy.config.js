module.exports = function (eleventyConfig) {
  const pathPrefix = process.env.ELEVENTY_PATH_PREFIX || "/";

  eleventyConfig.addPassthroughCopy({ "src/assets": "assets" });
  if (pathPrefix === "/") {
    // CNAME only makes sense when serving from the domain root, i.e. once
    // the custom domain is live. While serving from the github.io subpath,
    // skip it so GitHub Pages doesn't try to redirect to an unconfigured domain.
    eleventyConfig.addPassthroughCopy({ "src/CNAME": "CNAME" });
  }
  eleventyConfig.addWatchTarget("src/assets/css/");

  return {
    dir: {
      input: "src",
      output: "_site",
      includes: "_includes",
      data: "_data",
    },
    pathPrefix,
  };
};
