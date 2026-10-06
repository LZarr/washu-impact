#!/usr/bin/env bash
# One-time script to pull all site images off the Squarespace CDN into the repo
# so the site no longer depends on Squarespace staying online.
set -e

BASE="src/assets/images"
mkdir -p "$BASE/people" "$BASE/books" "$BASE/resources" "$BASE/jobs"

fetch() {
  local url="$1" out="$2"
  if [ -s "$out" ]; then
    echo "skip (exists): $out"
    return
  fi
  echo "fetching: $out"
  curl -sL "$url" -o "$out"
}

# Hero / section background images
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/f6fcf160-570b-45cd-8fa9-9832c05e0703/EA+Club+Banner.png?format=2500w" "$BASE/hero-banner.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820761394-QBPS8Y8DVIBNXQDQW3PO/AS12-51-7525.jpg?format=2500w" "$BASE/precipice-bg.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820769086-8ENND9XAERT3K2Q92ZH8/ISS048-E-10018.jpeg?format=2500w" "$BASE/careers-bg.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820782010-SBMC3ZHNY44PIN7VXK5O/ISS043-E-86375.jpeg?format=2500w" "$BASE/jobs-bg.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820784581-1GU486YQRK6RTG3MOA12/2013_Cassini_20130722_annotated_earth-moon_from_saturn_1920x1080.jpeg?format=2500w" "$BASE/biorisk-bg.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820788505-7BMQFIBKX3WDO28DAFB2/ISS063-E-68417.jpeg?format=2500w" "$BASE/indepth-bg.jpg"

# People headshots
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/205468bc-a9da-4501-b99c-7bf13e810488/Lily+Zarr+Headshot.jpg?format=750w" "$BASE/people/lily-zarr.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/6f26aea7-6102-4323-b0de-7df1a72ae906/WhatsApp+Image+2025-08-21+at+20.19.25_8b158621.jpg?format=750w" "$BASE/people/grace-tyau.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/fd6a4e29-1293-40a2-980a-ecb02a399160/WhatsApp+Image+2025-08-15+at+14.10.25_fa0875d9.jpg?format=750w" "$BASE/people/chanah-park.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/244fe360-c04f-42c0-965e-58931f15b67d/WhatsApp+Image+2025-08-28+at+00.06.13_f3270479.jpg?format=750w" "$BASE/people/steven-jeon.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661883048820-EOA4W8EP3GGCN006XEWH/Josh+wedding+pic+cropped.jpg?format=750w" "$BASE/people/reed-trende.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/0d627901-86d5-4af1-a48c-0261929b1939/image_50408449_1.jpg?format=750w" "$BASE/people/jacob-woessner.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/573abfe8-182c-4808-ab88-2f8204f28038/headshot+-+UCLA+outside+-+Bogard+%281%29.jpg?format=750w" "$BASE/people/jon-bogard.jpg"

# Resources page images
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820770974-JUBMQGZIB1CMPTLBGAF2/80%2C000_Hours_logo.svg.png?format=750w" "$BASE/resources/80000-hours-logo.png"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820770977-40SJIXTVJBWFXXJCFQCU/internships-for-impact-hero-5sQq-oN6InHZ-features-1-download.jpg.jpg?format=750w" "$BASE/resources/ea-internships.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820770981-BOM5E16VHUOPK4SP4GKI/Screen+Shot+2021-12-29+at+11.11.42+PM.png?format=750w" "$BASE/resources/magnify-mentoring.png"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820770985-ZOKS6KX767IUA58MLNBE/internships-for-impact-hero-5sQq-oN6InHZ-features-4-download.png.png?format=750w" "$BASE/resources/animal-advocacy-careers.png"

# Jobs page image
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820782014-E3T0A8MJ899X3YL4ZI3V/Earth-from-space-1-64e9a7c.jpg?format=1500w" "$BASE/jobs/80k-job-board.jpg"

# Book covers
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773403-7ADPNA3J4KJHFVI6WBBL/81kzN9OCLfS.jpg?format=500w" "$BASE/books/the-precipice.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773406-J59LK9WOFIG3KF3T4K8L/download.jpg?format=500w" "$BASE/books/the-scout-mindset.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773410-3PQQQLZTGRUAL3AJHCEP/71Y%2B8Cvjj7L.jpg?format=500w" "$BASE/books/the-alignment-problem.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773413-2YPC73NZ8HKVTAH96JYK/41k8CbeOR8L.jpg?format=500w" "$BASE/books/80000-hours.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773417-J94F6G5FPKMW8DDHTIBK/811jW-BHHIL.jpg?format=500w" "$BASE/books/doing-good-better.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773421-1WS5SRLRDYEOL6I12FUQ/81Ka09kEm5L.jpg?format=500w" "$BASE/books/human-compatible.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773425-7LBTKO4TU41JVNR859A1/91HCFt6IlGL.jpg?format=500w" "$BASE/books/strangers-drowning.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773429-4426PWZKT8GM8GA5CX6G/71GiSvm%2Ba0L.jpg?format=500w" "$BASE/books/superforecasting.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773434-4VN66T1BKZ657ZGGZ4ZW/41H%2BHb935YL.jpg?format=500w" "$BASE/books/poor-economics.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773438-220L2WWVHLLL5LYHNZVA/41wI53OEpCL._SX332_BO1%2C204%2C203%2C200_.jpg?format=500w" "$BASE/books/thinking-fast-and-slow.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773443-FT6TAFLV3KMI8CJ39L76/81qBWcQwn-L.jpg?format=500w" "$BASE/books/animal-liberation.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773447-82YAUDQREC1H6KA1EINA/814sKOe%2BBcL.jpg?format=500w" "$BASE/books/superintelligence.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773451-4SWSYW37K9RDXAU6W1Q2/41%2B8VbXBwHL._SX327_BO1%2C204%2C203%2C200_.jpg?format=500w" "$BASE/books/practical-ethics.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773455-4XPNQ37UIXIDUEMUMYHA/book_BP.jpg?format=500w" "$BASE/books/the-life-you-can-save.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773460-JCZAO3F8EDIKJYQ3MIS4/81FR-5nJzvL.jpg?format=500w" "$BASE/books/grilled.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773463-PF4FEXBIS20490EWTC5G/714i%2BZ1wDZL.jpg?format=500w" "$BASE/books/age-of-em.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773467-0G5H4R5CASRK3RVR4UY3/A1jE-KXPpvL.jpg?format=500w" "$BASE/books/command-and-control.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773471-594EJU6MY7Y80WND6TXI/9780307387844.jpg?format=500w" "$BASE/books/the-dead-hand.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773475-RTAEI9JOZFAKETFQTMNT/414BM7RcTcL._SX327_BO1%2C204%2C203%2C200_.jpg?format=500w" "$BASE/books/the-elephant-in-the-brain.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773478-M44Z4KSG9OIY8RPTEIU3/811JPWsCmeL.jpg?format=500w" "$BASE/books/how-to-create-a-vegan-world.jpg"
fetch "https://images.squarespace-cdn.com/content/v1/630d5f58c649ad7b9f67a0d6/1661820773481-HEP2DSKSXYTL80ZSXAY0/413LNaXSTUL._SX327_BO1%2C204%2C203%2C200_.jpg?format=500w" "$BASE/books/the-doomsday-machine.jpg"

echo "Done."
