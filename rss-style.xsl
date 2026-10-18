<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="/rss/channel/title"/> · Canal RSS</title>
        
        <!-- Google Fonts correspondientes a Círculo Kairós -->
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;600;700&amp;family=Inter:wght@400;500;600&amp;family=Newsreader:ital,opsz,wght@0,6..72,400;1,6..72,400&amp;family=Playfair+Display:ital,wght@0,600;0,700;1,400&amp;display=swap" rel="stylesheet"/>

        <style>
          :root {
            --bg-color: #fbf8f3;
            --bg-surface: #f4ede1;
            --bg-card: #f8f3ea;
            --text-main: #221f1d;
            --text-muted: #6d665f;
            --accent: #9e4734;
            --accent-dark: #783324;
            --border-soft: #e2d8c7;
            --border-dark: #221f1d;
            --font-serif: 'Playfair Display', Georgia, serif;
            --font-reader: 'Newsreader', Garamond, serif;
            --font-sans: 'Inter', -apple-system, sans-serif;
            --font-classical: 'Cinzel', serif;
          }

          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: var(--font-sans);
            line-height: 1.65;
            background-image: radial-gradient(rgba(158, 71, 52, 0.03) 1px, transparent 0);
            background-size: 24px 24px;
            padding: 2.5rem 1.5rem 5rem;
          }

          .container {
            max-width: 860px;
            margin: 0 auto;
          }

          /* Cuadro explicativo sobre qué es el feed */
          .rss-notice-box {
            background-color: var(--bg-surface);
            border: 1px solid var(--border-soft);
            border-left: 4px solid var(--accent);
            padding: 1.8rem;
            margin-bottom: 3.5rem;
          }
          .rss-notice-box h1 {
            font-family: var(--font-serif);
            font-size: 2rem;
            color: #84382B;
            margin-bottom: 0.5rem;
            letter-spacing: 0.08em;
          }
          .rss-notice-box p {
            font-family: var(--font-reader);
            font-size: 1.1rem;
            color: var(--text-muted);
            margin-bottom: 1.2rem;
          }
          .feed-url-copy {
            background: #ffffff;
            border: 1px solid var(--border-soft);
            padding: 0.6rem 0.9rem;
            font-family: monospace;
            font-size: 0.85rem;
            color: var(--text-main);
            display: inline-block;
            word-break: break-all;
            margin-bottom: 1rem;
          }
          .back-link {
            display: inline-block;
            font-family: var(--font-classical);
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.14em;
            color: var(--accent);
            text-decoration: none;
          }
          .back-link:hover { color: var(--accent-dark); text-decoration: underline; }

          /* Listado de entregas y tratados */
          .section-title {
            font-family: var(--font-classical);
            font-size: 0.88rem;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--accent);
            border-bottom: 2px solid var(--border-dark);
            padding-bottom: 0.5rem;
            margin-bottom: 2rem;
          }

          .feed-item {
            background-color: var(--bg-card);
            border: 1px solid var(--border-soft);
            padding: 1.8rem;
            margin-bottom: 1.8rem;
          }
          .item-category {
            display: inline-block;
            font-family: var(--font-classical);
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--accent);
            margin-bottom: 0.4rem;
          }
          .feed-item h2 {
            font-family: var(--font-serif);
            font-size: 1.4rem;
            line-height: 1.35;
            margin-bottom: 0.4rem;
          }
          .feed-item h2 a {
            color: var(--text-main);
            text-decoration: none;
          }
          .feed-item h2 a:hover {
            color: var(--accent);
          }
          .item-meta {
            font-size: 0.78rem;
            color: var(--text-muted);
            margin-bottom: 0.9rem;
          }
          .item-desc {
            font-family: var(--font-reader);
            font-size: 1.05rem;
            line-height: 1.7;
            color: #332f2c;
          }
        </style>
      </head>
      <body>
        <div class="container">
          
          <header class="rss-notice-box">
            <h1>CÍRCULO KAIRÓS</h1>
            <p>
              Estás visualizando el <strong>Canal RSS</strong> de la publicación. Este canal permite recibir las últimas monografías, tratados y relatos directamente en tu lector de feeds predilecto (Feedly, NetNewsWire, etc.).
            </p>
            <div class="feed-url-copy">
              <xsl:value-of select="/rss/channel/atom:link/@href"/>
            </div>
            <div>
              <a href="index.html" class="back-link">&#8592; Regresar a la portada principal</a>
            </div>
          </header>

          <h3 class="section-title">Últimas publicaciones indexadas</h3>

          <main>
            <xsl:for-each select="/rss/channel/item">
              <article class="feed-item">
                <span class="item-category"><xsl:value-of select="category"/></span>
                <h2>
                  <a>
                    <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                    <xsl:value-of select="title"/>
                  </a>
                </h2>
                <div class="item-meta">
                  <span><xsl:value-of select="author"/></span> · 
                  <time><xsl:value-of select="pubDate"/></time>
                </div>
                <p class="item-desc">
                  <xsl:value-of select="description"/>
                </p>
              </article>
            </xsl:for-each>
          </main>

        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
