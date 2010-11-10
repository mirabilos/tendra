<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
                   "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">

<!-- $Id -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2001/XInclude"
	xmlns="">

	<!--
		This is an XSLT transformation to produce Docbook XML.
		There are multiple different implementations of trans(1), all of which
		share most of their usage.
		This stylesheet centralises their individual differences, and
		conditionally outputs whichever page is relevant.
		It can also render out a consolidated page, documenting
		all implementations.
	-->

	<xsl:output method="xml" indent="yes" encoding="utf-8"/>

	<xsl:param name="trans" select="'all'"/>

	<xsl:template name="pad-command">
		<xsl:param name="command" select="''"/>

		<xsl:variable name="spaces">
			<xsl:if test="$trans = 'all'">
				<xsl:value-of select="'         '"/>
			</xsl:if>
		</xsl:variable>

		<command>
			<xsl:value-of select="$command"/>
			<xsl:value-of select="substring(translate($spaces, ' ', '&#xA0;'), string-length($command))"/>
		</command>
	</xsl:template>

	<xsl:template name="synopsis">
		<xsl:param name="command"/>

		<xsl:variable name="options">
			<xsl:choose>
				<xsl:when test="$command = 'trans386'">
					<arg choice="opt"><option>-D</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-a</option></arg>
					<arg choice="opt"><option>-h</option></arg>
					<arg choice="opt"><option>-k</option><replaceable>switch</replaceable></arg>
				</xsl:when>
				<xsl:when test="$command = 'alphatrans'">
					<arg choice="opt"><option>-D</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-S</option></arg>
				</xsl:when>
				<xsl:when test="$command = 'hppatrans'">
					<arg choice="opt"><option>-D</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-h</option></arg>
				</xsl:when>
				<xsl:when test="$command = 'mipstrans'">
					<arg choice="opt"><option>-D</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-S</option></arg>
				</xsl:when>
				<xsl:when test="$command = 'sparctrans'">
					<arg choice="opt"><option>-D</option><replaceable>switch</replaceable></arg>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="output">
			<xsl:choose>
				<xsl:when test="$command = 'alphatrans'">
					<arg choice='plain'><replaceable>binary-assembler-file</replaceable></arg>
					<arg choice='plain'><replaceable>symbol-table-file</replaceable></arg>
					<arg choice='opt'><replaceable>symbolic-assembler-file</replaceable></arg>
				</xsl:when>
				<xsl:when test="$command = 'mipstrans'">
					<arg choice='plain'><replaceable>op.G</replaceable></arg>
					<arg choice='plain'><replaceable>op.H</replaceable></arg>
					<arg choice='opt'><replaceable>op.s</replaceable></arg>
				</xsl:when>
				<xsl:otherwise>
					<arg choice='plain'><replaceable>output-file</replaceable></arg>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<cmdsynopsis>
			<xsl:call-template name="pad-command">
				<xsl:with-param name="command" select="$command"/>
			</xsl:call-template>

			<xsl:if test="$trans != 'all'">
				<xi:include xpointer="xpointer(//synopfragment[@id = 'options']/*)"/>
			</xsl:if>

			<xsl:if test="$options != ''">
				<xsl:copy-of select="$options"/>

				<sbr/>
			</xsl:if>

			<xsl:if test="$trans != 'all' and $options = ''">
				<sbr/>
			</xsl:if>

   			<arg choice="plain"><replaceable>input-file</replaceable></arg>

			<xsl:copy-of select="$output"/>
		</cmdsynopsis>
	</xsl:template>

	<xsl:template match="/">
		<xsl:variable name="allorself">
			<xsl:choose>
				<xsl:when test="$trans = 'all'">
					<xsl:text>all translators</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<command>
						<xsl:value-of select="$trans"/>
					</command>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:comment>
			Generated by trans-xsl.1.xsl. Do not edit.
		</xsl:comment>

		<refentry id='trans1'>
			<xsl:comment><![CDATA[
				Copyright (c) 2002-2007 The TenDRA Project <http://www.tendra.org/>.
				All rights reserved.

				Redistribution and use in source and binary forms, with or without
				modification, are permitted provided that the following conditions are met:

				1. Redistributions of source code must retain the above copyright notice,
				   this list of conditions and the following disclaimer.
				2. Redistributions in binary form must reproduce the above copyright notice,
				   this list of conditions and the following disclaimer in the documentation
				   and/or other materials provided with the distribution.
				3. Neither the name of The TenDRA Project nor the names of its contributors
				   may be used to endorse or promote products derived from this software
				   without specific, prior written permission.

				THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS
				IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
				THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
				PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
				CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
				EXEMPLARY OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
				PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
				OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
				WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
				OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
				ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
			]]></xsl:comment>

			<refmeta>
				<refentrytitle>trans</refentrytitle>
				<manvolnum>1</manvolnum>
			</refmeta>

			<refnamediv id='name'>
				<refname>
					<xsl:choose>
						<xsl:when test="$trans = 'all'">
							<xsl:text>trans-all</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$trans"/>
						</xsl:otherwise>
					</xsl:choose>
				</refname>

				<refpurpose>
					<xsl:choose>
						<xsl:when test="$trans = 'trans386'">
							<xsl:text>DRA TDF to 80386, 80486 and Pentium translator</xsl:text>
						</xsl:when>
						<xsl:when test="$trans = 'alphatrans'">
							<xsl:text>DRA TDF to DEC Alpha translator</xsl:text>
						</xsl:when>
						<xsl:when test="$trans = 'hppatrans'">
							<xsl:text>DRA TDF to HP PA-RISC translator</xsl:text>
						</xsl:when>
						<xsl:when test="$trans = 'mipstrans'">
							<xsl:text>DRA TDF to MIPS translator</xsl:text>
						</xsl:when>
						<xsl:when test="$trans = 'powertrans'">
							<xsl:text>DRA TDF to POWER translator</xsl:text>
						</xsl:when>
						<xsl:when test="$trans = 'sparctrans'">
							<xsl:text>DRA TDF to SPARC translator</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>DRA TDF to assembly translators</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</refpurpose>
			</refnamediv>

			<refsynopsisdiv id='synopsis'>
				<xsl:choose>
					<xsl:when test="$trans != 'all'">
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="$trans"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="'trans386'"/>
						</xsl:call-template>
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="'alphatrans'"/>
						</xsl:call-template>
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="'hppatrans'"/>
						</xsl:call-template>
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="'mipstrans'"/>
						</xsl:call-template>
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="'powertrans'"/>
						</xsl:call-template>
						<xsl:call-template name="synopsis">
							<xsl:with-param name="command" select="'sparctrans'"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>

				<cmdsynopsis>
					<xsl:call-template name="pad-command">
						<xsl:with-param name="command">
							<xsl:choose>
								<xsl:when test="$trans = 'all'">
									<replaceable>
										<xsl:text>trans</xsl:text>
									</replaceable>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$trans"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:with-param>
					</xsl:call-template>

					<group choice="req">
						<arg choice="plain"><option>-V</option></arg>
					</group>
				</cmdsynopsis>

				<xsl:if test="$trans = 'all'">
					<para>Most options are common to all translators.
						For brevity, these are not repeated above:</para>

					<cmdsynopsis>
						<xsl:call-template name="pad-command"/>

						<xi:include xpointer="xpointer(//synopfragment[@id = 'options']/*)"/>
					</cmdsynopsis>
				</xsl:if>


				<synopfragment id="options">
					<arg choice="opt"><option>-A</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-C</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-F</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-I</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-K</option><replaceable>str</replaceable></arg>
					<arg choice="opt"><option>-M</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-R</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-U</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-X</option></arg>

					<sbr/>

					<arg choice="opt"><option>-B</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-E</option></arg>
					<arg choice="opt"><option>-H</option></arg>
					<arg choice="opt"><option>-P</option></arg>
					<arg choice="opt"><option>-Q</option></arg>
					<arg choice="opt"><option>-W</option><replaceable>switch</replaceable></arg>
					<arg choice="opt"><option>-Z</option></arg>
				</synopfragment>
			</refsynopsisdiv>

			<refsection>
				<title>Description</title>

				<para>The code production portion of the TDF compiler is under the
					control of a TDF translator, which translates a TDF capsule into
					assembly.</para>

				<xsl:if test="$trans = 'alphatrans' or $trans = 'all'">
					<para><command>alphatrans</command> produces an AXP assembler
						file.</para>
				</xsl:if>

				<para>There are separate TDF translators for each target
					architecture.</para>

				<xsl:if test="$trans = 'hppatrans' or $trans = 'all'">
					<para><command>hppatrans</command> produces assembly code
						for the HP PA-RISC machines.</para>
				</xsl:if>

				<xsl:if test="$trans = 'mipstrans' or $trans = 'all'">
					<para><command>mipstrans</command> produces MIPS code.
						There are two versions, one for IRIX, and one for ULTRIX.
						Both produce .G and .H files required by as1, but may also
						optionally give .s assembly files using <option>-S</option>.
						Note that full run-time diagnostic information cannot be
						transmitted through the MIPS assembler, as(1).</para>
				</xsl:if>

				<xsl:if test="$trans = 'powertrans' or $trans = 'all'">
					<para><command>powertrans</command> produces assembly code
						common to the rs6000 and the POWERPc.</para>
				</xsl:if>

				<xsl:if test="$trans = 'sparctrans' or $trans = 'all'">
					<para><command>sparctrans</command> produces SPARC assembly
						code. There are two versions, one for SunOS, and one for
						Solaris.</para>
				</xsl:if>

				<para>The various different translators are referred to
					collectively as <command>trans</command>.</para>

				<para>It is recommended that <command>trans</command> should not be
					invoked directly, but via the user interface
					<citerefentry><refentrytitle>tcc</refentrytitle><manvolnum>1</manvolnum></citerefentry>.
					The file <option>-</option><replaceable>opt</replaceable> can
					be passed to <command>trans</command> by passing the option
					<option>-Wt,-</option><replaceable>opt</replaceable> to
					<citerefentry><refentrytitle>tcc</refentrytitle><manvolnum>1</manvolnum></citerefentry>.</para>
			</refsection>

			<refsection>
				<title>Options</title>

				<para>The options denoted by a capital letter are common to
					the TDF installers for all the architectures, although the
					defaults vary for each translator.</para>

				<para>Lowercase options are specific to each translator.</para>

				<xsl:if test="$trans = 'trans386' or $trans = 'all'">
					<para>The option <option>-a</option> is specific to
						<command>trans386</command>.</para>
				</xsl:if>

				<xsl:if test="$trans = 'hppatrans' or $trans = 'all'">
					<para>The options <option>-h</option> and <option>-d</option> are
						specific to <command>hppatrans</command>.</para>
				</xsl:if>

				<para><emphasis remap='I'>switch</emphasis> stands for either
					<literal>0</literal>, to switch an option off,
					or <literal>1</literal>, to switch it on.</para>

				<xsl:if test="$trans = 'all'">
					<para>The default states for common options differ per
						translator:</para>

					<table>
						<title>Per-translator defaults for common options</title>

						<col align="left"/>
						<col align="center"/>
						<col align="center"/>
						<col align="center"/>
						<col align="center"/>
						<col align="center"/>
						<col align="center"/>

						<thead>
							<tr>
								<th>Option</th>
								<th><code>trans386</code></th>
								<th><code>alphatrans</code></th>
								<th><code>hppatrans</code></th>
								<th><code>mipstrans</code></th>
								<th><code>powertrans</code></th>
								<th><code>sparctrans</code></th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td><option>-A</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-F</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&cross;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-I</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-K</option><replaceable>str</replaceable></td>
								<td>&check;</td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
								<td>&cross;</td>
								<td role="na">(no effect)</td>
							</tr>
							<tr>
								<td><option>-M</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-R</option><replaceable>switch</replaceable></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&check;</td>
								<td>&cross;</td>
								<td>&check;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-X</option></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
						</tbody>

						<tbody>
							<tr>
								<td><option>-B</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-C</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-D</option><replaceable>switch</replaceable></td>
								<td>&cross; <footnote>
										<para>This option is not supported on SCO or DragonFly, and on
											Linux is supported only for ELF.</para>
									</footnote></td>
								<td>&cross;</td>
								<td>&cross; <footnote>
										<para>See also <option>-d</option>.</para>
									</footnote></td>
								<td>&check; <footnote>
										<para>This option is not supported on ULTRIX.</para>
									</footnote></td>
								<td role="na">&ndash;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-E</option></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-H</option></td>
								<td>&cross;</td>
								<td>&cross; <footnote>
										<para>See also <option>-h</option>.</para>
									</footnote></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-P</option></td>
								<td>&cross; <footnote>
										<para>Not supported on Solaris.</para>
									</footnote></td>
								<td>&cross; <footnote>
										<para>Not fully implemented.</para>
									</footnote></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-Q</option></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-S</option></td>
								<td role="na">&ndash;</td>
								<td>&cross;</td>
								<td role="na">&ndash;</td>
								<td>&cross;</td>
								<td role="na">&ndash;</td>
								<td role="na">&ndash;</td>
							</tr>
							<tr>
								<td><option>-U</option><replaceable>switch</replaceable></td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
								<td>&check;</td>
							</tr>
							<tr>
								<td><option>-V</option></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
							<tr>
								<td><option>-W</option><replaceable>switch</replaceable></td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
								<td role="na">(no effect)</td>
							</tr>
							<tr>
								<td><option>-Z</option></td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
								<td>&cross;</td>
							</tr>
						</tbody>
					</table>
				</xsl:if>
			</refsection>

TODO: now go through and find undocumented options...

			<refsection>
				<title>Optimisation-specific common options</title>

				<para>The common options pertaining to optimisation are:</para>

				<variablelist>
					<varlistentry>
						<term><option>-A</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether <command>trans</command>
								should inline calls to <emphasis remap='I'>alloca</emphasis>.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is done by default.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-C</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether <command>trans</command>
								should apply the "constants out of loops"
								optimisation.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is done by default.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-F</option><replaceable>switch</replaceable></term>
						<listitem>
							<xsl:if test="$trans = 'trans386' or $trans = 'all'">
								<para>For <command>trans386</command>, this option determines
									whether the "strength reduction" optimisation
									should be applied.</para>
							</xsl:if>

							<xsl:if test="$trans = 'alphatrans' or $trans = 'all'">
								<para>For <command>alphatrans</command>, this option
									determines whether or not the "for all"
									optimisation should be applied.</para>
							</xsl:if>

							<xsl:choose>
								<xsl:when test="$trans = 'all'">
									<para>For <command>hppatrans</command>,
										<command>mipstrans</command>
										and <command>sparctrans</command>, this
										option determines whether the "for all"
										optimisation should be applied.</para>
								</xsl:when>

								<xsl:when test="$trans = 'hppatrans'
							                 or $trans = 'mipstrans'
							                 or $trans = 'sparctrans'">
									<para>For <command><xsl:value-of select="$trans"/></command>,
										this option determines whether the
										"for all" optimisation should be applied.</para>
								</xsl:when>
							</xsl:choose>

							<xsl:choose>
								<xsl:when test="$trans = 'alphatrans'">
									<para>For <command><xsl:value-of select="$trans"/></command>,
										this is not done by default.</para>
								</xsl:when>

								<xsl:when test="$trans = 'all'">
									<para>For all translators except <command>alphatrans</command>,
										this is done by default.</para>
								</xsl:when>

								<xsl:otherwise>
									<para>For <command><xsl:value-of select="$trans"/></command>,
										this is done by default.</para>
								</xsl:otherwise>
							</xsl:choose>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-I</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether <command>trans</command>
								should apply the "inlining" optimisation.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is done by default.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-K</option><replaceable>str</replaceable></term>
						<listitem>
							<para>Causes <command>trans</command> to optimise its
								code for a particular processor model, determined by
								<emphasis remap='I'>str</emphasis>.</para>

							<xsl:if test="$trans = 'trans386' or $trans = 'all'">
								<para>For <command>trans386</command>, the available values
									of <emphasis remap='I'>str</emphasis> are:</para>

								<table>
									<thead>
										<tr>
											<th>Option</th>
											<th>Processor</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td><code>-K3</code></td>
											<td>80386</td>
										</tr>
										<tr>
											<td><code>-K4</code> (default)</td>
											<td>80486</td>
										</tr>
										<tr>
											<td><code>-K5</code></td>
											<td>Pentium</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>

							<xsl:if test="$trans = 'powertrans' or $trans = 'all'">
								<para>For <command>powertrans</command>, the available values
									of <emphasis remap='I'>str</emphasis> are:</para>

								<table>
									<thead>
										<tr>
											<th>Option</th>
											<th>Processor</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td><code>-KP</code></td>
											<td>POWERPc</td>
										</tr>
										<tr>
											<td><code>-KR</code></td>
											<td>rs6000</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>

							<xsl:choose>
								<xsl:when test="$trans = 'all'">
									<para>For all other translators, at present there are no
										valid values for <emphasis remap='I'>str</emphasis>.</para>
								</xsl:when>

								<xsl:when test="$trans = 'trans386'
								             or $trans = 'powertrans'">
								</xsl:when>

								<xsl:otherwise>
									<para>For <command><xsl:value-of select="$trans"/></command>,
										at present there are no valid values for
										<emphasis remap='I'>str</emphasis>.</para>
								</xsl:otherwise>
							</xsl:choose>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-M</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>If this option is on, <command>trans</command>
								preserves division by a floating point number rather
								than replacing it by multiplication by the reciprocal
								of the number.
								While the latter produces faster code, it may lead to
								rounding errors.</para>

							<para>For <xsl:value-of select="$allorself"/>, by default, division by
								constants is preserved.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-R</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether <command>trans</command>
								should immediately round every floating point operation
								to its appropriate range.
								This produces slower code, but is necessary for strict
								IEEE conformance.</para>

							<xsl:choose>
								<xsl:when test="$trans = 'hppatrans' or $trans = 'powertrans'">
									<para>The default is to round after every operation
										for <command><xsl:value-of select="$trans"/></command>.</para>
								</xsl:when>

								<xsl:when test="$trans = 'all'">
									<para>The default is not to round after every operation
										for all translators except
										<command>hppatrans</command> and
										<command>powertrans</command>.</para>
								</xsl:when>

								<xsl:otherwise>
									<para>For <command><xsl:value-of select="$trans"/></command>,
										this is not done by default.</para>
								</xsl:otherwise>
							</xsl:choose>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-U</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether <command>trans</command>
								should apply the "loop unrolling" optimisation.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is done by default.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-X</option></term>
						<listitem>
							<para>This option disables all optimisations.
								All <command>trans</command>' optimisations
								are believed to be valid, so that any error in
								optimisation is a genuine bug.</para>

							<para>Various optimisations are performed by default for
								<xsl:value-of select="$allorself"/>.</para>
						</listitem>
					</varlistentry>
				</variablelist>
			</refsection>

			<refsection>
				<title>Other common options</title>

				<para>Common options not related to optimisation are:</para>

				<variablelist>
					<varlistentry>
						<term><option>-B</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether <command>trans</command>
								should report floating point
								constants which exceed their range.</para>
					
							<para>For <xsl:value-of select="$allorself"/>,
								this is done by default.</para>

							<para>If this option is switched off such constants are
								replaced by infinity.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-D</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether
								<command>trans</command> should produce Position
								Independent Code (PIC).</para>

							<xsl:if test="$trans = 'all'">
								<para>For all translators where it is supported,
									except <command>mipstrans</command>,
									this is not done by default.</para>
							</xsl:if>

							<xsl:if test="$trans != 'all' and $trans != 'mipstrans'">
								<para>For <command><xsl:value-of select="$trans"/></command>,
									this is not done by default.</para>
							</xsl:if>

							<xsl:if test="$trans = 'trans386' or $trans = 'all'">
								<para>For <command>trans386</command>, this
									option is not supported on the SCO or
									DragonFly platforms, and on the Linux
									platform it is supported only for
									ELF binary format.</para>
							</xsl:if>

							<xsl:if test="$trans = 'hppatrans' or $trans = 'all'">
								<para>For <command>hppatrans</command>, the
									translator-specific option
									<option>-d</option><replaceable>switch</replaceable>
									is also provided.
									The <option>-D</option> flag emulates cc's
									<emphasis remap='B'>+Z</emphasis> flag,
									<option>-d</option> emulates cc's
									<emphasis remap='B'>+z</emphasis> flag.
									Neither option has yet been tested.</para>
							</xsl:if>

							<xsl:if test="$trans = 'mipstrans' or $trans = 'all'">
								<para>For <command>mipstrans</command>, this is done
									by default in the IRIX version and not at all in
									the ULTRIX version.</para>
							</xsl:if>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-E</option></term>
						<listitem>
							<para>This option disables <command>trans</command>'
								constant overflow checks.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is done by default.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-H</option></term>
						<listitem>
							<para>This option causes <command>trans</command> to output
								debugging information in its output file.
								This will only work if the input TDF capsule contains
								debugging information.</para>

							<xsl:if test="$trans = 'trans386' or $trans = 'all'">
								<para>For <command>trans386</command>, on the SCO platform
									the format used by <emphasis remap='B'>dbxtra</emphasis>
									and <emphasis remap='B'>codeview</emphasis> is supported.
									On the SVR4.2 platform Dwarf 1 is supported,
									which is used by <emphasis remap='B'>debug</emphasis>.
									On the Solaris, DragonFly, and Linux platforms,
									<emphasis remap='B'>stabs</emphasis> is supported.
									The GNU debugger <emphasis remap='B'>gdb</emphasis> may
									be used on all platforms.</para>
							</xsl:if>

							<xsl:if test="$trans = 'hppatrans' or $trans = 'all'">
								<para>For <command>hppatrans</command>,
									the <option>-H</option> flag causes hppatrans to output
									<emphasis remap='B'>xdb</emphasis> compatible debugging
									information in its output file.
									This option is only available if the header
									file <filename>hpux_symtab.h</filename> was included
									whilst compiling hppatrans.<footnote>
										<para>hpux_symtab.h is available by anonymous FTP,
											but appears to have changed location over time.
											Your best option is to simply google for it.</para>
									</footnote></para>

								<para>Please note well that there is a known bug in the
									<option>-H</option> option for <command>hppatrans</command>.
									The bug sometimes prohibits <emphasis remap='B'>xdb</emphasis>
									reading selective diagnostic information from a suite of
									two or more modules linked together.</para>
							</xsl:if>

							<xsl:if test="$trans = 'mipstrans' or $trans = 'all'">
								<para>For <command>mipstrans</command> the diagnostic
									format used is  as used by the native compilers.</para>
							</xsl:if>

							<xsl:if test="$trans = 'sparctrans' or $trans = 'all'">
								<para>For <command>sparctrans</command>, the diagnostic
									format used is stabs for SunOS, and stabs-in-elf for
									Solaris (both as used by the native compilers).</para>
							</xsl:if>

							<para>Debugging information is not output by default
								for <xsl:value-of select="$allorself"/>.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-P</option></term>
						<listitem>
							<para>This option causes <command>trans</command> to
								output profiling information suitable for use with
								<citerefentry><refentrytitle>prof</refentrytitle><manvolnum>1</manvolnum></citerefentry>
								or a similar tool (see individual manual pages for
								details).</para>

							<xsl:if test="$trans = 'trans386' or $trans = 'all'">
								<para>On <command>trans386</command>, this option is
									currently not supported on the Solaris platform.</para>
							</xsl:if>

							<xsl:if test="$trans = 'alphatrans' or $trans = 'all'">
								<para>On <command>alphatrans</command>, this is not fully
									implemented.</para>
							</xsl:if>

							<xsl:if test="$trans = 'mipstrans' or $trans = 'all'">
								<para>On <command>mipstrans</command>, this option is
									untested at present, and should not be used.</para>
							</xsl:if>

							<para>Profiling information is not output by default
								for <xsl:value-of select="$allorself"/>.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-Q</option></term>
						<listitem>
							<para>This option causes <command>trans</command> to quit
								before processing its input files.
								This is particularly useful in conjunction with
								<option>-V</option>.</para>

							<para>For <command><xsl:value-of select="$allorself"/></command>,
								this is not done by default.</para>
						</listitem>
					</varlistentry>

					<xsl:if test="$trans = 'mipstrans'
				               or $trans = 'alphatrans'
				               or $trans = 'all'">
						<varlistentry>
							<term><option>-S</option></term>
							<listitem>
								<xsl:if test="$trans = 'alphatrans' or $trans = 'all'">
									<para>For <command>alphatrans</command>, when this option
										is present <command>alphatrans</command> will produce
										a symbolic assembler file in addition to its normal
										outputs.
										In this case the name of the symbolic assembler file
										must be present on the command line.</para>
								</xsl:if>

								<xsl:if test="$trans = 'mipstrans' or $trans = 'all'">
									<para>For <command>mipstrans</command>, this option will
									produce assembly code in the optional .s file.</para>
								</xsl:if>

								<xsl:if test="$trans = 'all'">
									<para>This option is not present on all other
										translators.</para>
								</xsl:if>

								<xsl:choose>
									<xsl:when test="$trans = 'all'">
										<para>For all translators where it is supported,
											this is not done by default.</para>
									</xsl:when>

									<xsl:otherwise>
										<para>For <command><xsl:value-of select="$trans"/></command>,
											this is not done by default.</para>
									</xsl:otherwise>
								</xsl:choose>
							</listitem>
						</varlistentry>
					</xsl:if>

					<varlistentry>
						<term><option>-V</option></term>
						<listitem>
							<para>This option causes <command>trans</command> to print
								its version number and the version of the TDF
								specification it supports.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is not done by default.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-W</option><replaceable>switch</replaceable></term>
						<listitem>
							<para>This option determines whether
								<command>trans</command> should make string literals
								writable.
								At present the C producer does not make use of this
								facility.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								at present all string literals
								are writable, and this cannot be altered.</para>
						</listitem>
					</varlistentry>

					<varlistentry>
						<term><option>-Z</option></term>
						<listitem>
							<para>This option causes <command>trans</command> to print
								the version number of all the TDF capsules
								it decodes.</para>

							<para>For <xsl:value-of select="$allorself"/>,
								this is not done by default.</para>
						</listitem>
					</varlistentry>
				</variablelist>
			</refsection>

			<refsection>
				<title>Translator-specific options</title>

				<xsl:if test="$trans = 'trans386' or $trans = 'all'">
					<para>The following options are specific to <command>trans386</command>:</para>

					<variablelist>
						<varlistentry>
							<term><option>-a</option></term>
							<listitem>
								<para>Always use a frame pointer.
									The default is to avoid using a frame pointer whenever possible.
									The default results in better performance, but in special
									cases where the stack is to be processed it may be necessary
									to enforce the use of a frame pointer.</para>
							</listitem>
						</varlistentry>

						<varlistentry>
							<term><option>-h</option></term>
							<listitem>
								<para>Do not use the .bss segment, always put data into the
									.data segment even if it is zero.
									This should very rarely be needed.
									The default is to use the .bss segment.</para>
							</listitem>
						</varlistentry>

							<varlistentry>
							<term><option>-k</option><replaceable>switch</replaceable></term>
							<listitem>
<!-- XXX: not just linux platforms only... also *BSD etc? -->
								<para>This option is applicable to DragonFly and Linux
									platforms only.
									If this option is on, <command>trans386</command>
									will produce output for an ELF binary format assembler,
									otherwise a.out binary format is assumed.
									By default this option is on, as appropriate for
									later versions of Linux.</para>
							</listitem>
						</varlistentry>
					</variablelist>
				</xsl:if>

				<xsl:if test="$trans = 'hppatrans' or $trans = 'all'">
					<para>The following options are specific to <command>hppatrans</command>:</para>

					<variablelist>
						<varlistentry>
							<term><option>-h</option></term>
							<listitem>
								<para>The <option>-h</option> flag causes hppatrans
									to output <emphasis remap='B'>gdb</emphasis>
									compatible,
									i.e. <emphasis remap='B'>stabs</emphasis>, debugging
									information in its output file.
									The <option>-h</option> flag is believed
									to be valid&mdash;any error is a genuine bug.</para>

								<para>The -H and -h options will only work if the input
									TDF capsule contains debugging information.</para>
							</listitem>
						</varlistentry>
					</variablelist>
				</xsl:if>

				<xsl:if test="$trans != 'trans386'
				          and $trans != 'hppatrans'
				          and $trans != 'all'">
					<para>There are no translator-specific options for
						<command><xsl:value-of select="$trans"/></command>.</para>
				</xsl:if>
			</refsection>

			<refsection>
				<title>See Also</title>

				<xsl:if test="$trans != 'all'">
					<para><citerefentry><refentrytitle>trans-all</refentrytitle><manvolnum>1</manvolnum></citerefentry></para>
				</xsl:if>

				<para><citerefentry><refentrytitle>as</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
					<citerefentry><refentrytitle>prof</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
					<citerefentry><refentrytitle>tcc</refentrytitle><manvolnum>1</manvolnum></citerefentry>.</para>
			</refsection>

		</refentry>
	</xsl:template>

</xsl:stylesheet>

