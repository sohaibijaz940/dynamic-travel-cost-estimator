# Travel Estimator — explained budgets, live context

**[Try the live Travel Estimator demo](https://sohaibijaz.dev/demos/travel/)** · [Case study](https://sohaibijaz.dev/projects/travel-cost-estimator/) · [Portfolio](https://sohaibijaz.dev)

![Modern Travel Estimator interface](https://raw.githubusercontent.com/sohaibijaz940/sohaib-engineering-portfolio/main/public/previews/travel.webp)

A travel-planning project that grew from relational database coursework into a browser workspace. It makes the assumptions behind a trip budget inspectable. **It is not a reservation or payment service.**

## Original foundation

The original `dynamic_travel_cost.sql`, coursework ZIP and ERD/report stay in this repository. The schema models Users, TravelDetails, Hotels, Bookings and PricingData. The modern edition is maintained in the shared portfolio repository rather than duplicating its Next.js server and shared components here.

## Modern demonstration

- Complete budget lines, user overrides, room capacity/date validation and a recalculated contingency.
- Configured FlightAPI searches with supplied airline/leg details, session-owned quote selection, freshness checks and explicit currency/group assumptions.
- Configured Places venue discovery and optional events; absent reviews/photos remain absent instead of being invented.
- Private plans, membership-scoped group itineraries, expense splits and local planning tools.
- Cinematic destination UI with mobile and reduced-motion support.

Base costs and optional comparison scenarios are illustrative. Live provider coverage, fields, billing and quotas vary. The UI labels provider quotes separately from estimates; no hotel or flight is booked.

## Inspect the original database

Import the actual file `dynamic_travel_cost.sql` into a suitable MySQL environment. The old README's `/sql/database_setup.sql` path did not exist here; this documentation now points to the real file. Original screenshots remain in the historical README below.

## Source and setup

- [Complete modern source](https://github.com/sohaibijaz940/sohaib-engineering-portfolio)
- [This project's modern page source](https://github.com/sohaibijaz940/sohaib-engineering-portfolio/tree/main/src/app/demos/travel/)
- [Local setup, providers and verification](https://github.com/sohaibijaz940/sohaib-engineering-portfolio#run-locally)
- [Engineering article source](https://github.com/sohaibijaz940/sohaib-engineering-portfolio/blob/main/src/content/writing/travel.mdx)
- [Original README, preserved for historical context](docs/ORIGINAL_README.md)

The public demo and portfolio are linked above. Original coursework and commit history remain preserved; source/setup links remain available for inspection.
