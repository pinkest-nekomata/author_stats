{% docs country_code_2 %}
Two-character country code
{% enddocs %}

{% docs currency_code %}
Three-character currency code
{% enddocs %}

{% docs currency_conversion_rate %}
Currency conversion rate - The rate of converting from one currency to another. Multipy the "from" currency by this number to get the "to" currency.
{% enddocs %}

{% docs currency_conversion_rate_source %}
Currency rates are not universal; they vary by time and by system. For example, D2D may use different conversion rates for a month than KDP. In this project, when the source is KDP, the rate has been calculated manually from Bethany Baker's actual KDP payouts. When the source is EST, it's an estimated rate based on web sources.
{% enddocs %}

{% docs dim_books %}
One row per book. Includes helpful information about each book, like IDs and series membership.
{% enddocs %}

{% docs dim_currency_exchange_rates %}
One row per currency conversion and effective window (i.e. from_cur x to_cur x effective_from).       

This table provides point-in-time currency exchange rate estimates. Effective from date is inclusive, Effective To date is exclusive. Note that currency exchange rates can vary significantly across systems, and it's not possible to look up the exact rate KDP used for a given month's payouts. Where the source is KDP, the rate is manually calculated from the "prior month's royalties" report and the actual payout Bethany Baker received. Where the source is EST, it's an estimate based on web exchange rate values.

Values are manually populated. When finalized values aren't available, the most recent values are used as estimates.
{% enddocs %}

{% docs dim_kenp_rates %}
One row per report month x marketplace. Provides the payout rate per KENP (Kindle Edition Normalized Page) in local currency and USD for each marketplace and each report month. Conversion estimates use the KDP currency exchange rate source. 

These rates in local currency are taken from [The Author Helper Suite](https://readerlinks.com/kenp_rates/index.php). This source is populated by volunteer authors and uses the data point with the highest page reads to calculate the rate for each month. Since data is user-entered, some inaccuracies are expected. Data is manually copied from the helper website to a seed file.
{% enddocs %}

{% docs ebook_asin %}
eBook ASIN (Amazon's unique ID number)
{% enddocs %}

{% docs ebook_isbn %}
eBook ISBN
{% enddocs %}

{% docs ebook_list_usd %}
eBook list price in USD (US Dollars)
{% enddocs %}

{% docs effective_from_inclusive %}
Inclusive - This is the valid row for records occuring on or after this date. For example, when royalty_date >= effective_from, this is the valid record.
{% enddocs %}

{% docs effective_to_exclusive %}
Exclusive - This is the valid row for records occurring before this date. For example, when royalty_date < effective_from, this is the valid record.
{% enddocs %}

{% docs d2d_start_date %}
Draft 2 Digital start date - the earliest date of data included in the D2D report row.

For all vendors other than Apple, the start date equals the end date. For Apple, sales are rolled up for each start/end window, and these don't correspond cleanly to whole months, nor are they consistent in duration.
{% enddocs %}

{% docs d2d_end_date %}
Draft 2 Digital end date - the latest date of data included in the D2D report row.

For all vendors other than Apple, the start date equals the end date. For Apple, sales are rolled up for each start/end window, and these don't correspond cleanly to whole months, nor are they consistent in duration.
{% enddocs %}

{% docs d2d_distributor %}
Draft 2 Digital distributor - The "parent company" the book was sold through, e.g. Amazon, Smashwords, Tolino, Apple
{% enddocs %}

{% docs d2d_title_id %}
Draft 2 Digital title ID - an internal D2D unique ID for the book
{% enddocs %}

{% docs d2d_vendor %}
Draft 2 Digital vendor - The "store" the book was sold through, e.g. Amazon.com (US), Amazon.co.uk (UK), iTunes
{% enddocs %}

{% docs from_cur %}
From currency - The currency being converted from (3 character code)
{% enddocs %}

{% docs is_final %}
If true, then the record is finalized. If false, then the record is still pending or estimated.
{% enddocs %}

{% docs kenp_per_book %}
The KENP (Kindle Edition Normalized Pages) of the full book. That is, how many "page reads" one full read of the book counts for.
{% enddocs %}

{% docs kenp_rate %}
The payout per KENP (Kindle Edition Normalized Page) in the marketplace's local currency. From [The Author Helper Suite](https://readerlinks.com/kenp_rates/index.php)
{% enddocs %}

{% docs kenp_rate_usd %}
The estimated payout per KENP (Kindle Edition Normalized Page) in USD. For closed months, uses the calculated conversion rates from KDP payouts. When closed data is not available (or hasn't been updated) uses the most recent KDP currency conversion rate and web estimates for currencies that do not yet have KDP-verified rates.
{% enddocs %}

{% docs list_price_per_unit_lcur %}
List price per unit (i.e. book) in local currency
{% enddocs %}

{% docs list_price_per_unit_usd %}
List price per unit (book) in USD (calculated with exchange rate estimates)
{% enddocs %}

{% docs marketplace %}
The name of the Amazon marketplace (i.e. subsidiary) as formatted in [The Author Helper Suite](https://readerlinks.com/kenp_rates/index.php)
{% enddocs %}

{% docs marketplace_url %}
The URL of the Amazon marketplace (i.e. subsidiary)
{% enddocs %}

{% docs num_in_series %}
Number in Series - What number the book is in the series
{% enddocs %}

{% offer_price_per_unit_lcur %}
Offer price per unit (book) in local currency. Reflects discounts and other offers, if applicable.
{% enddocs %}

{% offer_price_per_unit_usd %}
Offer price per unit (book) in USD. (Calcualted with exchange rate estimates.) Reflects discounts and other offers, if applicable.
{% enddocs %}

{% docs pprbk_isbn %}
Paperback ISBN
{% enddocs %}

{% docs pprbk_list_usd %}
Paperback list price in USD (US Dollars)
{% enddocs %}

{% docs report_month %}
The date representing the report month (first of the month). Tip: truncate to the month level (`date_trunc('month', <date>)`) for date comparisons
{% enddocs %}

{% docs series %}
The series the book belongs to
{% enddocs %}

{% docs split_share %}
Primarily used for D2D collab books. The royalties will be multiplied by this number (or by 1 if null) to calculate "my share". Calulates the D2D collab royalty split, which isn't in the D2D export. Only books I "own" in D2D are calculated this way. Collabs owned by others are separate.
{% enddocs %}

{% docs title_code %}
A unique abbreviation representing each book. Used for more streamlined reporting.
{% enddocs %}

{% docs to_cur %}
To currency - the currency being converted to (3 character code)
{% enddocs %}