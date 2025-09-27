# Introduction
- Senior software engineer with 4 years of experience working in global company
  with highly scalable application mostly on JVM framework. Latest experience
  is Agoda. joined around 3 years ago under a team called "Activities" sells
  tours and activity tickets. e.g. USS day pass, join in tour, esims, etc.

# Memorable projects (Good) - Pricing Module
- The first product which I own most of the implementation make it the most
  memorable
- The project is mostly focused on clearing list of tech debts we have lying in
  our backlog, mostly are minor bugs that aren't causing much revenue loss. but
  combined all of them we are talking about ~100 bookings a day for us (~5% of
  total daily bookings)
- So I raise this to my manager wanting to tidying these up entirely.
- The project is to pull all the pricing calculations and discounts into it's
  own module, separating using processor implementation. e.g. creating price
  breakdown, applying exchange rate, applying discounts and promocodes, logging
  and measurements

# Memorable projects (Tough) - Multiproduct promocode 
- Agoda were mostly focused on hotel cause it's top selling product which
  generates the most revenue and their discount system is mostly a legacy code
- Then we expand to sell flights ticket, flights think the same thing. system
  is too legacy, don't touch what's working
- Now as we are a 3rd product, we cannot just follow what flights did as we
  will generates more tech debt. that's why this project were being discussed
  between both product and tech
- We decided to take on the work with Hotel's team and revamped the legacy
  discount system to support all Agoda's products. back when we implement,
  flight team were reluctant to join since their product was just recently
  being built. 
- but later once we done, and we seduce then with how easy to integrate they
  finally join in
- The project is a bit tough, since our business are a bit different, so
  it's harder to design the system that supports both products but we're
  fortunate to have such a supportive teammates which making cross team works
  so much easier.

# Memorable projects (Can be improved)
- continuing from the Pricing module project where we clean up the backend
  logic of pricing calculations and measurements, we need to cleaning up the UI
  component to show wrong price breakdown to customer. In short, the breakdown
  math show to customer doesn't add up.
- but the booking page code is mostly legacy. comparing how little the impact
  we made to the effort needed this project, the change often get overlooked
  and deprioritize.
- This project itself taught me that we can't be fixing all the nitty gritty
  details if the value made doesn't fully trade off the effort needed

# Why would you like to join Airwallex
- Wanted to up the ceiling since I cannot grow further from Agoda in Thailand
- Airwallex sounds like a good place to work, corporate stability while
  offering the flexibility of start-up where we can still grow/deliver in fast
  iteration
- heard there's a lot of talented people working here, which is a great
  opportunity to learn/discuss with them.

# Why leaving Agoda
- No harsh feeling, people here are very open and collaborative. As stated
  above, it's the ceiling of this country, so if I want to grow further I would
  need to jump to other countries where the ceiling is higher

# Q&A
- How did Airwallex ship products, is it A/B experiment, how we determine the
  result, do you support customized feature for specific customer, how it's
  handled in code
- How's tech stack looks like. I heard it's mostly JVM based springboot with
  GCP? is this still relevant? are we limited only to this?
- How’s experience so far, how's the growth opportunity and diversity there?
