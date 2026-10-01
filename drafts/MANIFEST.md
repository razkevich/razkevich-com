# Draft posts manifest — razkevich.com

**Status:** published (copied to `public/`, deployed 2026-10-01).
**Source package:** Packages A–E from `blog-content-package/CONTENT_PACKAGE_Sep2025_Oct2026.md`.
**Location:** `/workspace/razkevich-com/drafts/<slug>/index.html`

| # | Title | Slug | Suggested publish date | Word count | Status |
|---|-------|------|------------------------|------------|--------|
| 1 | Caching That Actually Helps: Hit Rates, Invalidation, and the Patterns That Don't Blow Up Production | `caching-that-actually-helps-hit-rates-invalidation-and-the-patterns-that-dont-blow-up-production` | 2025-09-18 (September 18, 2025) | ~1389 | published |
| 2 | CAP Is Incomplete: PACELC and the Consistency Choices You Make on Every Query | `cap-is-incomplete-pacelc-and-the-consistency-choices-you-make-on-every-query` | 2025-12-04 (December 4, 2025) | ~1255 | published |
| 3 | The Dual-Write Problem: Why Your Events Lie — and How the Outbox Pattern Fixes It | `the-dual-write-problem-why-your-events-lie-and-how-the-outbox-pattern-fixes-it` | 2026-03-05 (March 5, 2026) | ~1256 | published |
| 4 | Multi-Tenancy Is the Real SaaS Architecture: Isolation Models, Noisy Neighbors, and Database Choices That Stick | `multi-tenancy-is-the-real-saas-architecture-isolation-models-noisy-neighbors-and-database-choices-that-stick` | 2026-06-12 (June 12, 2026) | ~1306 | published |
| 5 | Why LIKE Doesn't Scale: Inverted Indexes, Scatter-Gather, and How SaaS Should Index Search | `why-like-doesnt-scale-inverted-indexes-scatter-gather-and-how-saas-should-index-search` | 2026-09-25 (September 25, 2026) | ~1223 | published |

## Excerpts

### 1. Caching That Actually Helps: Hit Rates, Invalidation, and the Patterns That Don't Blow Up Production
- **Slug:** `caching-that-actually-helps-hit-rates-invalidation-and-the-patterns-that-dont-blow-up-production`
- **Path:** `drafts/caching-that-actually-helps-hit-rates-invalidation-and-the-patterns-that-dont-blow-up-production/index.html`
- **Suggested date:** September 18, 2025
- **Excerpt:** Caching is not a speed button — it is an amortized latency bet that loses when miss rate or stampede costs dominate. Decision math, layer stack, read/write patterns, invalidation, and stampede mitigations for production SaaS.
- **Word count:** ~1389
- **Status:** published

### 2. CAP Is Incomplete: PACELC and the Consistency Choices You Make on Every Query
- **Slug:** `cap-is-incomplete-pacelc-and-the-consistency-choices-you-make-on-every-query`
- **Path:** `drafts/cap-is-incomplete-pacelc-and-the-consistency-choices-you-make-on-every-query/index.html`
- **Suggested date:** December 4, 2025
- **Excerpt:** CAP is misread as pick-two-forever; the trade-off fires during partitions. PACELC adds the everyday latency-vs-consistency axis. Pick consistency per operation — especially in multi-tenant SaaS.
- **Word count:** ~1255
- **Status:** published

### 3. The Dual-Write Problem: Why Your Events Lie — and How the Outbox Pattern Fixes It
- **Slug:** `the-dual-write-problem-why-your-events-lie-and-how-the-outbox-pattern-fixes-it`
- **Path:** `drafts/the-dual-write-problem-why-your-events-lie-and-how-the-outbox-pattern-fixes-it/index.html`
- **Suggested date:** March 5, 2026
- **Excerpt:** You cannot atomically write a DB row and publish to a broker without distributed transactions. Outbox + polling or CDC relay, inbox idempotency, and when not to bother — the app-level complement to Kafka EOS.
- **Word count:** ~1256
- **Status:** published

### 4. Multi-Tenancy Is the Real SaaS Architecture: Isolation Models, Noisy Neighbors, and Database Choices That Stick
- **Slug:** `multi-tenancy-is-the-real-saas-architecture-isolation-models-noisy-neighbors-and-database-choices-that-stick`
- **Path:** `drafts/multi-tenancy-is-the-real-saas-architecture-isolation-models-noisy-neighbors-and-database-choices-that-stick/index.html`
- **Suggested date:** June 12, 2026
- **Excerpt:** Almost every SaaS decision is a tenancy decision in disguise. Isolation models, noisy-neighbor controls, DB-per-tenant vs shared schema + RLS, tiering, cells, and GDPR-complete offboarding.
- **Word count:** ~1306
- **Status:** published

### 5. Why LIKE Doesn't Scale: Inverted Indexes, Scatter-Gather, and How SaaS Should Index Search
- **Slug:** `why-like-doesnt-scale-inverted-indexes-scatter-gather-and-how-saas-should-index-search`
- **Path:** `drafts/why-like-doesnt-scale-inverted-indexes-scatter-gather-and-how-saas-should-index-search/index.html`
- **Suggested date:** September 25, 2026
- **Excerpt:** Product search needs a different structure than OLTP. Inverted indexes, BM25, scatter-gather, async indexing via outbox/CDC, tenant isolation of indexes, and hybrid BM25 + vector retrieval.
- **Word count:** ~1223
- **Status:** published

## Notes for review

- HTML chrome matches existing `public/posts/*/index.html` (header/nav/article/footer, `/styles.css`).
- Diagrams are ASCII/`<pre>` tables and sequences — no Medium/GitHub image links.
- Cross-links are prose references to prior published posts (Kafka EOS, rate limiting, LB/CDN); no broken hrefs to unpublished drafts.
- Published to `public/posts/<slug>/`, `posts.json` (32), homepage rebuilt, deployed via `scripts/deploy.sh`, committed.
