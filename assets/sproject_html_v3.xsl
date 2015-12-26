<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
	<!-- <xsl:output method='html' omit-xml-declaration='yes' indent='yes' /> -->
	<xsl:output method='html' media-type='text/html' encoding='UTF-8' doctype-system='about:legacy-compat' indent='no' />
	<xsl:template match='/sproject'>
		<!-- <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text> -->
		<!-- <![CDATA[&copy;]]> -->
		<!-- <xsl:text disable-output-escaping='yes'><![CDATA[<]]>!DOCTYPE html<![CDATA[>]]></xsl:text> -->
		<html lang='cs'>
		<head>
			<title><xsl:value-of select='./course/code'/> - <xsl:value-of select='./author/aname'/> (<xsl:value-of select='./author/uname'/>)</title>
			<meta charset='utf-8' />
			<meta name='description' content='{./course/code} - {./author/aname} ({./author/uname})' />
			<meta name='keywords' content='' />
			<meta name='author' content='noCtrl' />
			<meta name='robots' content='nofollow, noindex' />
			<link rel='stylesheet' href='./assets/stylesheet.css' />
			<script type='text/javascript' src='./assets/javascripts.js'></script>
		</head>
		<body>
			<header>
				<div>
					<div class="logo">
						<a href='https://fit.cvut.cz/' target='_blank'><img class="logo" src='./assets/fit.png' alt='České vysoké učení technické v Praze' title='ČVUT - fakulta informačních technologií' /></a>
					</div>
					<div class="menu">
					   <ul class="menu">
	  						<li><a class="fright" onclick="main.toggleComments()">Komentáře zapnuty</a></li>
							<li><a class="fright" href="#popis">Popis</a></li>
	  						<li><a class="fright" href="#data_model">Datový model</a></li>
	  						<li><a class="fright" href="#relational_model">Relační model</a></li>
  						</ul>
  						<ul class="menu">
	  						<li><a class="fright" href="#queries">Dotazy</a></li>
	  						<li><a class="fright" href="#queries_table">Tabulka dotazů</a></li>
	  						<li><a class="fright" href="#scripts">Ke stažení</a></li>
	  						<li><a class="fright" href="#conclusion">Závěr</a></li>
  					</ul>
					</div>
				</div>
			</header>
			<main>
				<h1><xsl:value-of select='./content/title' /></h1>
				<ul id='head_info'>
					<li>
						<div>
							<xsl:value-of select='./author/aname' /> (<xsl:value-of select='./author/uname'/>) / <a href='mailto:{./author/email}'><xsl:value-of select='./author/email' /></a><br />
							<xsl:value-of select='./course/seminar' />
						</div>
					</li>
					<li>
						<div>
							<strong><xsl:value-of select='./course/code' /> - <xsl:value-of select='./course/cname' /></strong><br />
							<xsl:value-of select='./course/semester' />
						</div>
					</li>
				</ul>
				<div id='declaration'><xsl:value-of select='./content/declaration'/></div>
				<!-- Description -->
				<h2 id="popis"><xsl:value-of select='./content/description/title'/></h2>
				<div class='paragraph'>
					<xsl:for-each select='./content/description/*'>
						<xsl:if test='local-name()="para"'>
							<p><xsl:value-of select='.'/></p>
						</xsl:if>
						<xsl:if test='local-name()="comment"'>
							<div class='comment'>
								<xsl:for-each select='./para'>
									<div><xsl:value-of select='.'/></div>
								</xsl:for-each>
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>
				<!-- Procedural extension -->
				<xsl:if test='./course/code="BI-SQL"'>
					<h2><xsl:value-of select='./content/description_procedural/title'/></h2>
					<div class='paragraph'>
						<xsl:for-each select='./content/description_procedural/*'>
							<xsl:if test='local-name()="para"'>
								<p><xsl:value-of select='.'/></p>
							</xsl:if>
							<xsl:if test='local-name()="comment"'>
								<div class='comment'>
									<xsl:for-each select='./para'>
										<div><xsl:value-of select='.'/></div>
									</xsl:for-each>
									<xsl:for-each select='./list'>
										<ol>
											<xsl:apply-templates mode='list' />
										</ol>
									</xsl:for-each>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:if>
				<!-- Data model -->
				<xsl:if test='./content/data_model or ./course/code="BI-DBS"'>
					<h2 id="data_model"><xsl:value-of select='./content/data_model/title'/></h2>
					<div class='paragraph'>
						<p><a href='{./content/data_model/dm_picture/mediaobject/imageobject/imagedata/@fileref}' target='_blank'><img src='{./content/data_model/dm_picture/mediaobject/imageobject/imagedata/@fileref}' alt='{./content/data_model/title}' title='' /></a></p>
						<xsl:if test='./content/data_model/comment'>
							<div class='comment'>
								<xsl:for-each select='./content/data_model/comment/para'>
									<div><xsl:value-of select='.'/></div>
								</xsl:for-each>
							</div>
						</xsl:if>
						<xsl:for-each select='./content/data_model/dm_discussion/*'>
							<xsl:if test='local-name()="para"'>
								<p><xsl:value-of select='.'/></p>
							</xsl:if>
							<xsl:if test='local-name()="comment"'>
								<div class='comment'>
									<xsl:for-each select='./para'>
										<div><xsl:value-of select='.'/></div>
									</xsl:for-each>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:if>
				<!-- Relation model -->
				<xsl:if test='./content/relational_model or ./course/code="BI-SQL"'>
					<h2 id="relational_model"><xsl:value-of select='./content/relational_model/title'/></h2>
					<div class='paragraph'>
						<p><a href='{./content/relational_model/rm_picture/mediaobject/imageobject/imagedata/@fileref}' target='_blank'><img src='{./content/relational_model/rm_picture/mediaobject/imageobject/imagedata/@fileref}' alt='{./content/data_model/title}' title='' /></a></p>
						<xsl:if test='./content/relational_model/comment'>
							<div class='comment'>
								<xsl:for-each select='./content/relational_model/comment/para'>
									<div><xsl:value-of select='.'/></div>
								</xsl:for-each>
							</div>
						</xsl:if>
						<xsl:for-each select='./content/relational_model/rm_discussion/*'>
							<xsl:if test='local-name()="para"'>
								<p><xsl:value-of select='.'/></p>
							</xsl:if>
							<xsl:if test='local-name()="comment"'>
								<div class='comment'>
									<xsl:for-each select='./para'>
										<div><xsl:value-of select='.'/></div>
									</xsl:for-each>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:if>
				<!-- PLSQL -->
				<xsl:if test='./course/code="BI-SQL"'>
					<h2><xsl:value-of select='./content/plsql/title'/></h2>
					<div class='paragraph'>
						<xsl:for-each select='./content/plsql/*'>
							<xsl:if test='local-name()="para"'>
								<p><xsl:apply-templates mode='moje_para' /></p>
							</xsl:if>
							<xsl:if test='local-name()="comment"'>
								<div class='comment'>
									<xsl:for-each select='./para'>
										<div><xsl:value-of select='.'/></div>
									</xsl:for-each>
								</div>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:if>
				<!-- SQL queries -->
				<h2 id="queries"><xsl:value-of select='./content/queries/title'/></h2>
				<div class='paragraph'>
					<ol>
						<xsl:for-each select='./content/queries/dotazy/dotaz'>
							<li id='{@dotaz_id}'>
								<strong>Dotaz #<xsl:value-of select='@dotaz_id'/></strong><xsl:text> </xsl:text><small><a href='#t_{@dotaz_id}'>[Tabulka pokryti kategorií SQL příkazů]</a></small>
								<xsl:for-each select='./*'>
									<xsl:if test='local-name()="title" and /sproject/course/code="BI-SQL"'>
										<h3><xsl:value-of select='.'/></h3>
									</xsl:if>
									<xsl:if test='local-name()="subtitle" and /sproject/course/code="BI-SQL"'>
										<h4><xsl:value-of select='.'/></h4>
									</xsl:if>
									<xsl:if test='local-name()="para" and /sproject/course/code="BI-SQL"'>
										<p><xsl:apply-templates mode='moje_para' /></p>
									</xsl:if>
									<xsl:if test='local-name()="popis_dotazu"'>
										<xsl:for-each select='./para'>
											<p><xsl:apply-templates mode='moje_para' /></p>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test='local-name()="comment"'>
										<div class='comment'>
											<xsl:for-each select='./para'>
												<div><xsl:apply-templates mode='moje_para' /></div>
											</xsl:for-each>
										</div>
									</xsl:if>
									<xsl:if test='local-name()="exec_plan" and /sproject/course/code="BI-SQL"'>
										<div class='comment plan'>
											<strong>Exekuční plán:</strong>
											<xsl:for-each select='./para'>
												<div><xsl:apply-templates mode='moje_para' /></div>
											</xsl:for-each>
										</div>
									</xsl:if>
									<xsl:if test='local-name()="relacni_algebra" and /sproject/course/code="BI-DBS"'>
										<xsl:for-each select='.'>
											<p class='relational_algebra'><xsl:apply-templates mode='moje_para' /></p>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test='local-name()="sql"'>
										<xsl:for-each select='.'>
											<p class='sql_query'><xsl:apply-templates mode='moje_para' /></p>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test='local-name()="sql_result"'>
										<xsl:for-each select='./para'>
											<p class='sql_result'><strong>Výsledek SQL dotazu:</strong><xsl:apply-templates mode='moje_para' /></p>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
							</li>
						</xsl:for-each>
					</ol>
				</div>
				<!-- SQL queries - table -->
				<h2 id="queries_table">Tabulka pokrytí kategorií SQL příkazů</h2>
				<div class='paragraph'>
					<table>
						<thead>
							<tr>
								<th>Kategorie</th>
								<th>Kódy porývajících dotazů</th>
								<th>Charekteristika kategorie příkazu</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select='./content/queries/pokryti_dotazu/radek'>
								<tr>
									<td><xsl:value-of select='./kategorie' /></td>
									<td>
										<xsl:for-each select='./odkazy/link'>
											<a href='{@url}' id='t_{.}'><xsl:apply-templates mode='moje_para' /></a>
											<xsl:if test='position()!=last()'>
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</td>
									<td><xsl:value-of select="./kategorie_popis"/></td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:for-each select='./content/queries/comment'>
						<div class='comment'>
							<xsl:for-each select='./*'>
								<div><xsl:apply-templates mode='moje_para' /></div>
							</xsl:for-each>
						</div>
					</xsl:for-each>
				</div>
				<!-- Procedural extension -->
				<xsl:if test='./course/code="BI-SQL"'>
					<h2><xsl:value-of select='./content/proc_objects/title'/></h2>
					<div class='paragraph'>
						<ol id='proc_objects'>
							<xsl:for-each select='./content/proc_objects/proc_object'>
								<li>
									<strong><xsl:value-of select="./title"/></strong><br /><br />
									<xsl:for-each select='./*'>
										<xsl:if test='local-name()="test"'>
											<div class='test'>
												<strong>Test</strong>
												<xsl:for-each select='./*'>
													<xsl:if test='local-name()="list"'>
														<ul>
															<xsl:apply-templates mode='list' />
														</ul>
													</xsl:if>
													<xsl:if test='local-name()="para"'>
														<p><xsl:apply-templates mode='moje_para' /></p>
													</xsl:if>
												</xsl:for-each>
											</div>
										</xsl:if>
										<xsl:if test='local-name()="comment"'>
											<div class='comment'>
												<xsl:for-each select='./para'>
													<div><xsl:apply-templates mode='moje_para' /></div>
												</xsl:for-each>
											</div>
										</xsl:if>
										<xsl:if test='local-name()="proc_sql"'>
											<xsl:for-each select='.'>
												<p class='sql_query'><xsl:apply-templates mode='moje_para' /></p>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test='local-name()="result"'>
											<xsl:for-each select='.'>
												<div class='result'><strong>Závěr z testování:</strong><br /><xsl:apply-templates mode='moje_para' /></div>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test='local-name()="proc_log"'>
											<xsl:for-each select='.'>
												<p class='sql_query sql_result'><strong>Záznam o proběhlém testu (log):</strong><xsl:apply-templates mode='moje_para' /></p>
											</xsl:for-each>
										</xsl:if>
									</xsl:for-each>
								</li>
							</xsl:for-each>
						</ol>
					</div>
				</xsl:if>

				<!-- Scripts -->
				<h2 id="scripts">Ke stažení</h2>
				<div class='paragraph'>
					<table>
						<thead>
							<tr>
								<th>Popis</th>
								<th>Soubor</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select='./content/scripts/tabulka/radek'>
								<tr>
									<td><xsl:value-of select='./kategorie' /></td>
									<td>
										<xsl:for-each select='./odkazy/link'>
											<a href='{@url}' id='t_{.}'><xsl:apply-templates mode='moje_para' /></a>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:for-each select='./content/scripts/*'>
						<xsl:if test='local-name()="comment"'>
							<div class='comment'>
								<xsl:for-each select='./*'>
									<div><xsl:apply-templates mode='moje_para' /></div>
								</xsl:for-each>
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>

				<!-- Conclusion -->
				<h2 id="conclusion"><xsl:value-of select='./content/conclussions/title'/></h2>
				<div class='paragraph'>
					<xsl:for-each select='./content/conclussions/*'>
						<xsl:if test='local-name()="para"'>
							<p><xsl:apply-templates mode='moje_para' /></p>
						</xsl:if>
						<xsl:if test='local-name()="comment"'>
							<div class='comment'>
								<xsl:for-each select='./*'>
									<div><xsl:apply-templates mode='moje_para' /></div>
								</xsl:for-each>
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>
				<!-- References -->
				<h2><xsl:value-of select='./content/references/title'/></h2>
				<div class='paragraph references'>
					<xsl:for-each select='./content/references/*'>
						<xsl:if test='local-name()="para"'>
							<div><xsl:apply-templates mode='moje_para' /></div>
						</xsl:if>
						<xsl:if test='local-name()="comment"'>
							<div class='comment'>
								<xsl:for-each select='./*'>
									<div><xsl:apply-templates mode='moje_para' /></div>
								</xsl:for-each>
							</div>
						</xsl:if>
					</xsl:for-each>
				</div>
			</main>
			<footer>
				<div>© 2015 ČVUT - České vysoké učení technické</div>
			</footer>
		</body>
		</html>
	</xsl:template>
	<xsl:template match='link' mode='moje_para'>
		<a href='{@url}'><xsl:value-of select='.' /></a>
	</xsl:template>
	<xsl:template match='imagedata' mode='moje_para'>
		<a href='{@fileref}'><img src='{@fileref}' alt='image' title='' /></a>
	</xsl:template>
	<xsl:template match='sub' mode='list'>
		<ol><xsl:apply-templates mode='list' /></ol>
	</xsl:template>
	<xsl:template match='para' mode='list'>
		<li><xsl:apply-templates mode='list' /></li>
	</xsl:template>
	<xsl:template match='proc_log' mode='list'>
		<p class='sql_query sql_result'><xsl:apply-templates mode='moje_para' /></p>
	</xsl:template>
	<xsl:template match='breakline' mode='list'>
		<br />
	</xsl:template>
</xsl:stylesheet>
